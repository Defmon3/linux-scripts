import subprocess

# Define the package(s) you want to install
packages = ["requests", "pathlib", "loguru"]

# Run pip install command
try:
    for package in packages:
        subprocess.run(["pip", "install", package], check=True)
    print("Packages installed successfully.")
except subprocess.CalledProcessError as e:
    print(f"Error installing packages: {e}")