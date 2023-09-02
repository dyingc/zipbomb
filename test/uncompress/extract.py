#!/usr/bin/env python3

import zipfile
import sys
import os

def extract_zip(zip_path):
    """
    Extracts the contents of a ZIP file to the current directory.

    :param zip_path: Path to the ZIP file
    """
    if not os.path.exists(zip_path):
        print(f"Error: {zip_path} does not exist.")
        return

    with zipfile.ZipFile(zip_path, 'r') as zip_ref:
        zip_ref.extractall()
        print(f"Extracted contents of {zip_path} to the current directory.")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python extract_zip.py <path_to_zip_file>")
        sys.exit(1)

    zip_file_path = sys.argv[1]
    extract_zip(zip_file_path)

