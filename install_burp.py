import os
import shutil
import subprocess
import tarfile
from pathlib import Path

import requests
from loguru import logger as log


# Burp

def get_original_user_home() -> Path:
    if sudo_user := os.environ.get('SUDO_USER'):
        return Path(f'/home/{sudo_user}')
    else:
        return Path.home()


def download(url: str, filename: str | Path = None) -> Path:
    if filename is None:
        filename = Path(url).name
    if isinstance(filename, str):
        filename = Path(filename)

    if not filename.exists():
        log.info(f"Downloading {url} to {filename}")
        filename.parent.mkdir(parents=True, exist_ok=True)
        filename.touch()
        get_response = requests.get(url)
        filename.write_bytes(get_response.content)
    return filename


def cmd(command: str) -> subprocess.CompletedProcess:
    try:
        result = subprocess.run(
            f"{command}",
            shell=True,
            check=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
        )
        log.debug(f"Command: {command} \nResult: {result}")
        return result
    except subprocess.CalledProcessError as e:
        log.error(f"Error running command: {e}")
        log.error(f"Error running command: {e.stderr}")

        raise e


class JavaInstaller:
    def __init__(self):
        self.java_install_dir = None
        self.java_root = Path("/opt/java")
        self.jre_url = "https://javadl.oracle.com/webapps/download/AutoDL?BundleId=249192_b291ca3e0c8548b5a51d5a5f50063037"
        self.tar_filename = "jre-8u301-linux-x64.tar.gz"
        self.jre_tar_file = self.java_root / self.tar_filename

    def install_java(self) -> str:
        text = " Starting installation of Java "
        log.debug(f"{text:#^50}")

        if globs := list(self.java_root.glob("*")):
            log.info(f"Java already installed:\n{globs}")
            return ""

        download(url=self.jre_url, filename=self.jre_tar_file)
        self.extract_tar()
        self.clean_up()
        log.debug(f"RETURNING {self.java_install_dir}/bin/java")
        return f"{self.java_install_dir}/bin/java"

    def extract_tar(self):
        with tarfile.open(self.jre_tar_file, "r:gz") as tar:
            log.info(f"Extracting Java to {self.java_root}")
            # Extract all the contents to the specified directory
            members = tar.getmembers()
            extract_dir = os.path.commonprefix([member.name for member in members])[:-1]
            self.java_install_dir = self.java_root / extract_dir
            tar.extractall(path=self.jre_tar_file.parent)

    def clean_up(self):
        log.info("Cleaning up")
        self.jre_tar_file.unlink(missing_ok=True)
        test_result = cmd(f"sudo {self.java_install_dir}/bin/java -version")
        if test_result.returncode != 0:
            log.error("Java installation failed")
        else:
            log.success("Java installed successfully")


class JdkInstaller:
    def __init__(self):
        self.java_install_dir = None
        self.jdk_url = "https://download.oracle.com/java/18/archive/jdk-18.0.2.1_linux-x64_bin.deb"
        self.jdk_file = "oracle-jdk-18-linux-x64.deb"


    def install_jdk(self):
        print("")
        text = " JDK install starting "
        log.debug(f"{text:#^50}")
        filename = download(url=self.jdk_url, filename=self.jdk_file)

        cmd(f"sudo apt install -f -y ./{filename}")
        text = " JDK install finished "
        log.success(f"{text:#^50}")
        filename.unlink(missing_ok=True)


class BurpInstaller:


    def __init__(self):
        self.cheanup_for_testing()
        self.cwd = get_original_user_home() / "temp"
        self.cwd.mkdir(parents=True, exist_ok=True)
        os.chdir(self.cwd)
        log.debug(f"Ensured working dir: {self.cwd}")

        self.repo_dir = self.cwd / "BurpSuiteProCracked"
        self.install_dir = Path("/opt/BurpSuitePro")
        self.extensions_dir = self.repo_dir / "BurpSuitePro_+_BurpBountyPro_v2.6.1_+_Extensions"

    def cheanup_for_testing(self):
        log.success("Cleaning up for testing")
        shutil.rmtree(Path.home() / "temp", ignore_errors=True)
        shutil.rmtree(Path("/opt/java"), ignore_errors=True)
        shutil.rmtree(Path("/opt/BurpSuitePro"), ignore_errors=True)

    def install_jdk(self):
        pass

    def mk_BhurpSuthPhro(self) -> Path:
        BhurpSuthPhro = Path("/opt/BurpSuitePro/BhurpSuthPhro")  # noqa
        BhurpSuthPhro.touch()
        BhurpSuthPhro.write_text("""#!/bin/sh
    
        "/opt/BurpSuitePro/jre/bin/java" "--add-opens=java.desktop/javax.swing=ALL-UNNAMED" "--add-opens=java.base/java.lang=ALL-UNNAMED" "--add-opens=java.base/jdk.internal.org.objectweb.asm=ALL-UNNAMED" "--add-opens=java.base/jdk.internal.org.objectweb.asm.tree=ALL-UNNAMED" "--add-opens=java.base/jdk.internal.org.objectweb.asm.Opcodes=ALL-UNNAMED" `"-javaagent:/opt/BurpSuitePro/Dr-FarFar.jar"` "-noverify" "-jar" "/opt/BurpSuitePro/burpsuite_pro.jar"
    
        _Note: Updte -javaagent:Dr-FarFar.jar path_""")
        return BhurpSuthPhro

    def move(self, src: Path, dest: Path):
        log.debug(f"Moving {src} to {dest}")
        shutil.move(src, dest)

    def install_burp(self):  # sourcery skip: extract-method
        text = " Running BurpSuitePro installation script"
        log.debug(f"{text:#^50}")

        self.download_files()

        java_binary = JavaInstaller().install_java()
        JdkInstaller().install_jdk()
        # setup paths

        if not self.install_dir.exists():
            shutil.rmtree(self.repo_dir, ignore_errors=True)

            cmd(f"sudo git clone https://github.com/GTekSD/BurpSuitePro-1.7.37-and-2022.8.5-Cracked.git {self.repo_dir.name}")

            log.debug("Installing burp in /opt/BurpSuitePro/")
            log.debug("Press Next>Next>Next>Next")

            cmd("sudo sh burpsuite_pro_linux_v2023_11_1_1.sh")
            self.move(self.extensions_dir / "BurpSuitePro-Crack/Config.Dr-FarFar", self.install_dir)
            self.move(self.extensions_dir / "BurpSuitePro-Crack/Dr-FarFar.jar", self.install_dir)
            self.move(self.extensions_dir / "Burp-Bounty-Pro", self.install_dir)
            self.move(self.repo_dir / "keygen.jar", self.install_dir)
            self.move(self.repo_dir / "loader.jar", self.install_dir)
            print("""Instructions:
            After opening drfarfar
            1. Click on 'RUN'
            2. Copy '[license Key] (Ctrl + A) >>>> (Ctrl + C)' paste it into (Ctrl + V) BurpSuitePro
            3. Click 'Next'
            4. Click on 'Manual Activalion'
            5. 'Copy Request' paste it into drfarfar '[Activation Request]'
            6. Copy '[Activation Responce]' click on 'Paste response' in BurpSuitePro
            7. 'Next'
            Finish
            """)
            os.chdir("/opt/BurpSuitePro")
            cmd(f"sudo {java_binary} -jar /opt/BurpSuitePro/Dr-FarFar.jar &")
            bsp_file = self.mk_BhurpSuthPhro()
            cmd(f"sudo chmod +777 {bsp_file.resolve()}")


    def download_files(self):
        download(
            url="https://portswigger-cdn.net/burp/releases/download?product=pro&version=2023.11.1.1&type=Linux",
            filename="burpsuite_pro_linux_v2023_11_1_1.sh"
        )
        download(
            url="https://portswigger-cdn.net/burp/releases/download?product=pro&version=2023.11.1.1&type=Jar",
            filename="burpsuite_pro_v2023.11.1.1.jar"
        )


if __name__ == '__main__':
    BurpInstaller().install_burp()
