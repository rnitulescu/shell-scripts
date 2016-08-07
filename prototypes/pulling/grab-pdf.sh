#! /usr/bin/sh

## Prototype shell script for pulling all pdf documents in a url directory
## This script does the following:
##      1. uses lynx to convert html output from http request into plain text 
##         (to avoid needing to parse html source code)
##      2. sed dumps all text following keyword 'References'
##         (at the bottom of the lynx dump, there is always a section called "References"
##          It seems to always contain the list of all urls/links contained on the page)
##      3. grep keeps only lines ending in ".pdf"
##      4. xargs passes all those urls to wget to download all the pdfs from the directory

## Example: grab-pdf http://www.webpage.com/folderwithpdfs/

lynx -dump -width 120 $1 | \
    sed -e '1,/References/d' | \
    grep '\.pdf$' | \
    xargs wget
