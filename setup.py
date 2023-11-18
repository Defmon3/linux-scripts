import os
import os.path

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
    for directory in ["Documents" "Music" "Pictures" "Public" "Templates" "Videos" "linux-scripts"]:
        if os.path.exists(directory):
            sudo(f"rm -rf {directory}")
            print(f"Removed {directory}")
    if not os.path.exists("proj"):
        os.mkdir("proj")


@myprint("Installing packages")
def install_packages():
    for pack in ["terminator", "netcat-traditional"]:
        message(f"Installing {pack}")
        install(pack)
        print(" ")


@myprint("Update and Upgrade packages")
def update_and_upgrade():
    myprint("Updating and Upgrading")
    sudo("apt -q update")
    sudo("apt -q upgrade")
    myprint("End")


@myprint("Running scripts")
def run_scripts():
    for script in ["wordlists.sh",
                    "xminds.sh",
                   "fix_postgres.sh",
                   "burp_pro.sh"]:
        message(f"Running script {script}")
        run_script(script)
        print(" ")


def install_proton():
    filename = download(
        "https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.3_all.deb")
    install(f"./{filename}")
    install("proton-vpn-gnome-desktop")


def main():
    myprint("Starting setup script")

    remove_dirs()
    update_and_upgrade()
    install_packages()
    sudo('chsh -s "$(which zsh)"', yes=False)
    install_proton()
    run_scripts()
    message("Cleaning up")
    sudo("apt autoremove")
    sudo("unset DEBIAN_FRONTEND", yes=False)
    os.system(f"bash -c 'unset DEBIAN_FRONTEND'")
    # sudo("apt install gvm")


if __name__ == '__main__':
    main()
