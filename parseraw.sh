#!/bin/bash

if [ -z "$1" ]; then
    ifile="raw.json"
else
    ifile="$1"
fi

if [ -z "$2" ]; then
    ldate=`date -I`
else
    ldate="$2"
fi

cd ..
cd apistart2
if [ -f "$ifile" ]; then
    echo "Beautify..."
    rm parsed/*
    mkdir parsed
	node ../JSFormatter/handleStart2.js $ifile start2.json
	if [ -f start2.json ]; then
        rm $ifile
        git add -u :/
        git add *.json
		git commit -m "Update $ldate"
        git push
	fi
else
    echo "Nothing to do.."
fi