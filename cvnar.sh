#!/bin/bash

# DO NOT RUN IN A FOLDER THAT ALREADY CONTAINS JPEG (*.JPG) IMAGES OR XML FILES -- THEY WILL BE DELETED!!!

#Make Backup of Nar file
#echo "Making backup"
#cp $1 "$1.bak"

#Strip Extension
tempfile="${1##*/}"
fname="${tempfile%.*}"

#Unzip the file
echo "Unzipping NAR file contents"
unzip $1
wait ${!}

#Deleting extraneous files
rm -f *_rlv.jpg
wait ${!}

echo "Resizing Images"
#Resize Images
mogrify -resize 320 *.jpg

#Convert JPG to Animated GIF
convert -delay 15 -loop 0 *.jpg "$fname.gif"

#Clean Up 
#rm -f *.jpg
#rm -f *.xml
echo "Finished"
