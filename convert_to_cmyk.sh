#!/bin/sh
#
# Converts files in dir1 to CMYK colorspace. Outputs files to dir2
#
APPDIR="/home/ville/tocmyk/"
INPUT_DIR="${APPDIR}input"
OUTPUT_DIR="${APPDIR}output"
ICC_PROFILE="/home/ville/tocmyk/ISOnewspaper26v4.icc"

echo Starting to process files to CMYK with following settings:
echo -e "INPUT_DIR:\t$INPUT_DIR"
echo -e "OUTPUT_DIR:\t$OUTPUT_DIR"
echo -e "ICC_PROFILE:\t$ICC_PROFILE"
echo Press enter to continue, ctrl-c to quit.
echo Starting in 2 seconds...

read foo

for f in $INPUT_DIR*
do
	echo Converting file $f to CMYK...
	#The conversion
	convert -density 220 -quality 100 $f -colorspace CMYK -profile $ICC_PROFILE $OUTPUT_DIR$(basename "$f")
done
echo DONE!
