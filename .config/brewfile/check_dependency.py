#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# FileName:     sample
# CreatedDate:  2018-06-28 17:13:23
#

import os, sys
import subprocess


memory = []


def get_packages():
    lines = subprocess.check_output(["brew", "deps", "--installed", "--1"])
    lines = lines.decode('utf-8').split("\n")[:-1]
    packages = [ line[:line.find(':')] for line in lines ]

    return packages

def check_remove_package(package):
    key = input("Do you want to remove {}? (Y/n): ".format(package))
    if (key in ['y', 'Y']):
        subprocess.call(["brew", "uninstall", package])
    else:
        memory.append(package)

def check_result(package, result):
    if (not result and package not in memory):
        check_remove_package(package)

def check_dependency(packages):
    for package in packages:
        if package in memory:
            continue
        print("# " + package)
        result = subprocess.check_output(["brew", "uses", "--installed", package])
        check_result(package, result)

def main():
    for i in range(5):
        packages = get_packages()
        check_dependency(packages)


if __name__ == '__main__':
    main()
