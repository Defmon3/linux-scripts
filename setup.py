import os
import os.path
import re

import requests


def download(url: str, filename: str = None) -> str:
    if filename is None:
        filename = os.path.basename(url)
    if not os.path.exists(filename):
        print(f"Downloading {url} to {filename}")
        get_response = requests.get(url)
        with open(filename, "wb") as out_file:
            out_file.write(get_response.content)
            return filename
    else:
        print(f"File {filename} already exists")


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


def raw(command: str):
    return os.system(command)


def cmd(command: str):
    os.system(f"bash -c 'set -euo pipefail && set -x && {command}'")


def sudo(command: str, yes: bool = True):
    if yes:
        cmd(f"sudo  {command} -y")
    else:
        cmd(f"sudo  {command}")


def install(command: str, yes: bool = True):
    sudo(f"apt install {command}", yes=yes)


def run_script(script: str):
    print(f"Running script {script}")
    raw(f"bash {script}")


@myprint("Removing and adding directories")
def remove_dirs():
    for directory in ["Documents", "Music", "Pictures", "Public", "Templates", "Videos", "linux-scripts"]:
        dir_path = f"/home/kali/{directory}"
        print(f"Exist {dir_path} == {os.path.exists(dir_path)}")
        if os.path.exists(dir_path):
            sudo(f"rm -rf {dir_path}", yes=False)
            print(f"Removed {dir_path}")
    if not os.path.exists("proj"):
        print(f"Exist proj == {os.path.exists(dir_path)}")
        os.mkdir("proj")


@myprint("Installing packages")
def install_packages():
    for pack in ["terminator", "netcat-traditional"]:
        message(f"Installing {pack}")
        install(pack)
        print(" ")


@myprint("Update and Upgrade packages")
def update_and_upgrade():
    with open("console-setup", "w") as out_file:
        out_file.write("""console-setup   console-setup/charmap47 select UTF-8
console-setup   console-setup/fontface47 select Fixed
console-setup   console-setup/fontsize-text47 select 16
""")

    myprint("Updating and Upgrading")

    sudo("apt -q update")
    os.system("bash -c 'sudo debconf-set-selections < /etc/console-setup &&sudo apt -q -y upgrade'")
    myprint("End")
    if os.path.exists("console-setup"):
        os.remove("console-setup")



@myprint("Installing protonvpn")
def install_proton():
    filename = download(
        "https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.3_all.deb")
    install(f"./{filename}")
    install("proton-vpn-gnome-desktop")
    if os.path.exists(filename):
        os.remove(filename)

@myprint("Installing wordlists")
def install_wordlists():
    if not os.path.exists("/usr/share/wordlists"):
        os.mkdir("/usr/share/wordlists")
    if not os.path.exists("/usr/share/wordlists/xsspayloads.txt"):
        download("https://raw.githubusercontent.com/payloadbox/xss-payload-list/master/Intruder/xss-payload-list.txt",
                 "xss-payload-list.txt")
    if not os.path.exists("/usr/share/wordlists/sql-injection-payload-list.txt"):
        if os.path.exists("/usr/share/wordlists/sql-injection-payload-list"):
            sudo("rm -rf /usr/share/wordlists/sql-injection-payload-list")
        sudo(
            "git clone https://github.com/payloadbox/sql-injection-payload-list.git /usr/share/wordlists/sql-injection-payload-list",
            yes=False)

@myprint("Installing xminds")
def install_xminds():
    install("snapd")
    sudo("service snapd start", yes=False)
    sudo("apt update")
    sudo("snap install core", yes=False)
    sudo("snap install xmind", yes=False)
    if os.path.exists("/home/kali/.bashrc"):
        with open("/home/kali/.bashrc", "r") as file:
            filedata = file.read()

        if not filedata.find("export PATH=$PATH:/snap/bin") > 0:
            filedata += "\nexport PATH=$PATH:/snap/bin"
            with open("/home/kali/.bashrc", "w") as file:
                file.write(filedata)

@myprint("Fixing postgresql")
def fix_postgres():
    if os.path.exists("/etc/postgresql/16/main/postgresql.conf"):
        with open("/etc/postgresql/16/main/postgresql.conf", "r") as file:
            filedata = file.read()
        with open("/etc/postgresql/16/main/postgresql.conf", "w") as file:
            re.sub("port = 5433", "port = 5432", filedata)
            file.write(filedata)
            message("Changed postgresql.conf port to 5432")


def main():
    myprint("Starting setup script")

    remove_dirs()
    update_and_upgrade()
    install_packages()
    sudo('chsh -s "$(which zsh)"', yes=False)

    install_wordlists()
    install_proton()
    install_xminds()
    fix_postgres()
    message("Cleaning up")
    sudo("apt autoremove")
    os.system(f"bash -c 'unset DEBIAN_FRONTEND'")
    # sudo("apt install gvm")


if __name__ == '__main__':
    main()
