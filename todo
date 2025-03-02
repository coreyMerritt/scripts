#!/bin/bash

# Check local
echo " "
grep -RnI \
	--color=always "$HOME/00-manual" \
	--exclude-dir=".git" \
	-e "TODO: " \
	--exclude="*todo*" \
	--exclude="*.vim*" \
	--exclude-dir="*.vscode*" \
        --exclude-dir="dist" \
        --exclude-dir="node_modules" |
	awk 'length <= 999' | 
	grep -v "How to map these?" 
echo "" 

