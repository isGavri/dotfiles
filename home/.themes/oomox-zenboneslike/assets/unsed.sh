#!/bin/sh
sed -i \
         -e 's/rgb(0%,0%,0%)/#1c1917/g' \
         -e 's/rgb(100%,100%,100%)/#b4bdc3/g' \
    -e 's/rgb(50%,0%,0%)/#1c1917/g' \
     -e 's/rgb(0%,50%,0%)/#9D9592/g' \
 -e 's/rgb(0%,50.196078%,0%)/#9D9592/g' \
     -e 's/rgb(50%,0%,50%)/#322D2A/g' \
 -e 's/rgb(50.196078%,0%,50.196078%)/#322D2A/g' \
     -e 's/rgb(0%,0%,50%)/#B4BFC4/g' \
	"$@"
