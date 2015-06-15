@echo off

REM DO NOT RUN IN A FOLDER THAT ALREADY CONTAINS JPEG (*.JPG) IMAGES OR XML FILES -- THEY WILL BE DELETED!!!

echo Creating zip from NAR file
copy %1 *.zip

echo Unzipping NAR file contents
7z e %~n1.zip

echo Deleting extraneous JPG files
del *_rlv.jpg

echo Resizing images
mogrify -resize 320 *.jpg

echo Creating GIF
convert -delay 15 -loop 0 *.jpg %~n1.gif

echo Cleaning up
REM Uncomment the next three lines to perform clean up
REM del *.jpg
REM del *.xml
REM del %~n1.zip
echo Finished

