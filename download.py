import os

import argparse
import sys

import requests


def main():
    print(f"Current working dir = {os.getcwd()}")

    args = argparse.parse_args(sys.argv[1:])
    download("https://portswigger-cdn.net/burp/releases/download?product=pro&version=2023.11.1.1&type=Linux",
             f"{args.parent_dir}/Downloads/burpsuite_pro_linux_v2023_11_1_1.sh")
    download("https://portswigger-cdn.net/burp/releases/download?product=pro&version=2023.11.1.1&type=Jar",
             f"{args.parent_dir}/Downloads/burpsuite_pro_v2023.11.1.1.jar")


def download(url: str, filename: str):
    if not os.path.exists(filename):
        print(f"Downloading {url} to {filename}")
        get_response = requests.get(url)
        with open(filename, "wb") as out_file:
            out_file.write(get_response.content)
    else:
        print(f"File {filename} already exists")


if __name__ == '__main__':
    argparse = argparse.ArgumentParser()
    argparse.add_argument("--parent_dir", required=True, help="Parent directory")
    main()