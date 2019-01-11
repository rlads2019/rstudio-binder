#!/bin/bash


zip myfile.zip *.Rmd *.html

curl -F "file=@myfile.zip" https://file.io

printf "\n\n"
