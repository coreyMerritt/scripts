#!/usr/bin/env python3

import sys
import math

if ("-h" in sys.argv or "--help" in sys.argv):
  print(f'{sys.argv[0]} table_width table_depth')

table_width = float(sys.argv[1])
table_depth = float(sys.argv[2])

SEAL_COAT = (1 / 16)
FLOOD_COAT = (1 / 8)
IN_TO_OZ = 0.554113
OZ_TO_GALLONS = 128

# Cubic inches
seal_area = (table_width * table_depth * SEAL_COAT)
flood_area = (table_width * table_depth * FLOOD_COAT)

# Fluid Ounces
seal_total_oz = math.ceil(seal_area * IN_TO_OZ)
flood_total_oz = math.ceil(flood_area * IN_TO_OZ)

seal_resin_oz = math.ceil(seal_total_oz / 2)
seal_hardener_oz = math.ceil(seal_total_oz / 2)

flood_resin_oz = math.ceil(flood_total_oz / 2)
flood_hardener_oz = math.ceil(flood_total_oz / 2)

total_resin_oz = math.ceil(seal_resin_oz + flood_resin_oz)
total_hardener_oz = math.ceil(seal_hardener_oz + flood_hardener_oz)
grand_total_oz = math.ceil(total_resin_oz + total_hardener_oz)

# Gallons

seal_total_ga = round((seal_total_oz / OZ_TO_GALLONS), 2)
flood_total_ga = round((flood_total_oz / OZ_TO_GALLONS), 2)

seal_resin_ga = round((seal_total_ga / 2), 2)
seal_hardener_ga = round((seal_total_ga / 2), 2)

flood_resin_ga = round((flood_total_ga / 2), 2)
flood_hardener_ga = round((flood_total_ga / 2), 2)

total_resin_ga = round((seal_resin_ga + flood_resin_ga), 2)
total_hardener_ga = round((seal_hardener_ga + flood_hardener_ga), 2)
grand_total_ga = round((total_resin_ga + total_hardener_ga), 2)



print(f'\nTotal for Seal: \t{seal_total_oz}oz \t{seal_total_ga}ga')
print(f'\tSeal Resin: \t{seal_resin_oz}oz \t{seal_resin_ga}ga')
print(f'\tSeal Hardener: \t{seal_hardener_oz}oz \t{seal_hardener_ga}ga\n')

print(f'\nTotal for Flood: \t{flood_total_oz}oz \t{flood_total_ga}ga')
print(f'\tFlood Resin: \t{flood_resin_oz}oz \t{flood_resin_ga}ga')
print(f'\tFlood Hardener: {flood_hardener_oz}oz \t{flood_hardener_ga}ga\n')

print(f'\nGrand Total: \t\t{grand_total_oz}oz \t{grand_total_ga}ga')
print(f'\tTotal Resin: \t{total_resin_oz}oz \t{total_resin_ga}ga')
print(f'\tTotal Hardener: {total_hardener_oz}oz \t{total_hardener_ga}ga\n')
