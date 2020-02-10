"""
File: zip_helper.py
Author: Miles Dowe
Description:
    Has helper functions to zip and unzip files.
"""

from zipfile import ZipFile, ZIP_DEFLATED

def zip_file(filename):
    """
    Zip a file using filename, returns resulting file's name.
    """

    zipfile = filename[:-3] + "zip"
    with ZipFile(zipfile, 'w', compression=ZIP_DEFLATED, compresslevel=9) as zipper:
        zipper.write(filename)

    # Return the zipfile name
    return zipfile

def unzip_file(filename, location):
    """
    Unzip a file using filename to provided location.
    """
    with ZipFile(filename, 'r') as zipper:
        zipper.extractall(location)
