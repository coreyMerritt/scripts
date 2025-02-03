#!/usr/bin/env python3

import os

scripts = os.path.expanduser("~/00-manual/scripts")

print("\nBash:")
for file in os.listdir(scripts):
  if (".sh" in file): 
    print(f"\t{file}")



print("\nPython:")
for file in os.listdir(scripts):
  if (".py" in file): 
    print(f"\t{file}")


print("\nPowershell:")
for file in os.listdir(scripts):
  if (".ps1" in file):
    print(f"\t{file}")

print()

