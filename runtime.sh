#!/bin/bash

START_TIME="$(date +%s.%N)"

eval "$@"

END_TIME="$(date +%s.%N)"

DIFFERENCE=$(echo "$END_TIME - $START_TIME" | bc)
FORMATTED_DIFFERENCE=$(printf "%.3f" "$DIFFERENCE")
echo -e "\n\tOperation took: ${FORMATTED_DIFFERENCE}s\n"

