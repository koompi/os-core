#!/bin/bash
# Author HangsiaHONG <hangsia@koompi.org>

echo "Welcome to AKFS script..."

bash res/version-check.sh > logFiles/log1
if grep -q 'ERROR\|not found' logFiles/log1; then
    echo $(cat logFiles/log1 | grep 'ERROR\|not found')
    echo "Check log1 file for more info"

else
    echo "~~version-check.sh OK~~"
fi

bash res/library-check.sh > logFiles/log2
if grep -q 'ERROR\|not found' logFiles/log2; then
    echo $(cat logFiles/log2 | grep 'ERROR\|not found')
    
    if [ $(cat logFiles/log2 | grep -c "not found") -eq 3 ]; then
	echo "~~3 or None not found, library-check.sh OK~~"
    else
        echo "Check log2 file for more info"
    fi
else
    echo "~~library-check.sh OK~~"
fi

echo "If All ok, add a new disk (sudo fdisk) and run script2.sh to create partition."

