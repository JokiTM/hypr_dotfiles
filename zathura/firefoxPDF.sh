#!/bin/bash 

tmpDir=/tmp/firePDF
mkdir -p $tmpDir
tmpFile=$(mktemp -q ${tmpDir}/firepdf_XXX.pdf)
cd /home/mathis/Downloads/ # cd into dowloads so u can save in zathura with ':write tmpFilename.pdf'
mv "$1" $tmpFile 
zathura $tmpFile
trash $tmpFile
