#!/bin/bash 

tmpDir=/tmp/firePDF
mkdir -p $tmpDir
#tmpFile=$(mktemp -q ${tmpDir}/firepdf_XXX.pdf)
cd /home/mathis/ # cd into home so u can save in zathura with ':write tmpFilename.pdf'
file="$tmpDir/$(basename "$1")"
notify-send "$file"
if [[ -e "$file" ]]; then
    echo "File $(basename "$1") exists"
    exit 1
fi
mv "$1" "$file"
zathura "$file"
trash "$file"
