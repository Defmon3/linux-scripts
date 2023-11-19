import os
import os.path
import shutil
import subprocess
from pathlib import Path

import requests

import inst_py_pack
from install_burp import BurpInstaller

a = inst_py_pack


def get_original_user_home() -> Path:
    if sudo_user := os.environ.get('SUDO_USER'):
        return Path(f'/home/{sudo_user}')
    else:
        return Path.home()


def download(url: str, filename: str | Path = None) -> Path:
    if filename is None:
        filename = Path(url).name

    if not filename.exists():
        print(f"Downloading {url} to {filename}")
        get_response = requests.get(url)
        filename.write_bytes(get_response.content)
        return filename


def message(text: str):
    print(" ")
    print(f"{text:#^50}")


def myprint(text):
    def decorator(func):
        def wrapper(*args, **kwargs):
            message(text)
            result = func(*args, **kwargs)
            message("END")
            print(" ")
            print(" ")
            return result

        return wrapper

    return decorator


def cmd(command: str, user: str = None):
    subprocess.run(f"{command}", shell=True, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)


def user_cmd(command: str):
    user = get_original_user_home().name
    cmd(f"sudo -u {user} {command}")


# Step 1: Setting up directories
@myprint("Settings up directories")
def setup_directories():
    """
    Remove directories that are not needed and add a temp directory
    :return:
    """
    home_dir = Path("/home/kali")
    for directory in ["Documents", "Music", "Pictures", "Public", "Templates", "Videos", "linux-scripts"]:
        shutil.rmtree(home_dir / directory, ignore_errors=True)

    (home_dir / "temp").mkdir(exist_ok=True)

    user_cmd("mkdir -p /home/kali/temp")

    os.chdir(Path.home() / "temp")


# Step 3: Install packages
@myprint("Installing packages")
def install_packages():
    for pack in ["terminator", "netcat-traditional"]:
        message(f"Installing {pack}")
        cmd(f"apt install -y {pack}")
        print(" ")


# Step 2: Update and upgrade packages
@myprint("Update and Upgrade packages")
def update_and_upgrade_packages():
    myprint("Updating")
    cmd("sudo apt update -q ")
    myprint("Updating")
    cmd("sudo apt upgrade -q -y ")
    myprint("End")


# Step 6: Install protonvpn
@myprint("Installing protonvpn")
def install_proton():
    filename = download(
        "https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.3_all.deb")
    cmd(f"sudo apt install ./{filename.name} -y")
    cmd("sudo apt install proton-vpn-gnome-desktop -y")
    if filename.exists():
        filename.unlink()


# Step 5: Install wordlists
@myprint("Installing wordlists")
def install_wordlists():
    wordlist_dir = Path("/usr/share/wordlists")
    #wordlist_dir.mkdir(exist_ok=True)
    user_cmd(f"mkdir -p {wordlist_dir}")
    if not (wordlist_dir / "xsspayloads.txt").exists():
        filename = download("https://raw.githubusercontent.com/payloadbox/xss-payload-list/master/Intruder/xss-payload-list.txt", "xss-payload-list.txt")
        shutil.move(wordlist_dir, (wordlist_dir / filename.name))
        cmd(f"sudo chmod 777 {filename.resolve()}")
    inject_file_path = wordlist_dir / "sql-injection-payload-list.txt"
    if not inject_file_path.exists():
        cmd("sudo git clone https://github.com/payloadbox/sql-injection-payload-list.git")
        shutil.move(inject_file_path.name, (wordlist_dir / inject_file_path.name))
        cmd(f"sudo chmod 777 {str(wordlist_dir / inject_file_path.name)}")

# Step 7: Install xminds
@myprint("Installing xminds")
def install_xminds():
    cmd("sudo apt install snapd")
    cmd("sudo service snapd start")
    cmd("sudo systemctl enable snapd")
    cmd("sudo apt update")
    cmd("sudo snap install core")
    cmd("sudo snap install xmind")
    bashrc = Path("/home/kali/.bashrc")
    if bashrc.exists():
        data = bashrc.read_text()
        if data.find("export PATH=$PATH:/snap/bin") <= 0:
            data += "\nexport PATH=$PATH:/snap/bin"
            bashrc.write_text(data)


# Step 8: Fix postgresql
@myprint("Fixing postgresql")
def fix_postgres():
    cfg_file = Path("/etc/postgresql/16/main/postgresql.conf")
    if cfg_file.exists():
        data = cfg_file.read_text()
        data = data.replace("port = 5433", "port = 5432")
        cfg_file.write_text(data)
        message("Changed postgresql.conf port to 5432")


def main():
    try:
        myprint("Starting setup script")
        cmd('sudo chsh -s "$(which zsh)"')  # Step 4

        setup_directories()  # Step 1
        update_and_upgrade_packages()  # Step 2
        install_packages()  # Step 3
        install_wordlists()  # step 5
        install_proton()  # step 6
        install_xminds()  # step 7
        fix_postgres()  # step 8
        BurpInstaller().install_burp()  # step 9

        # sudo("apt install gvm")
    except Exception as e:
        print(f"Exception {e}")
    finally:
        message("Cleaning up")
        cmd("sudo apt autoremove")
        cmd("/home/kali")


if __name__ == '__main__':
    main()
