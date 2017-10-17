#!/bin/sh
#
# Converts files to preferred color profile
#
APPDIR="/home/ville/IM_profile_changer/"
INPUT_DIR="${APPDIR}input/"
OUTPUT_DIR="${APPDIR}output/"
OUTPUT_PROFILE="${APPDIR}ISOnewspaper26v4.icc"
INPUT_PROFILE="${APPDIR}sRGB.icc"

echo Starting to process files from $(basename "$INPUT_PROFILE") to $(basename "$OUTPUT_PROFILE") with following settings:
echo -e "INPUT_DIR:\t$INPUT_DIR"
echo -e "OUTPUT_DIR:\t$OUTPUT_DIR"
echo -e "INPUT_PROFILE:\t$INPUT_PROFILE"
echo -e "OUTPUT_PROFILE:\t$OUTPUT_PROFILE"
echo Press enter to continue, ctrl-c to quit.

read foo

for f in $INPUT_DIR*
do
	echo Converting file $f...
	#The conversion
	convert -density 220 -quality 100 $f -profile $INPUT_PROFILE -profile $OUTPUT_PROFILE $OUTPUT_DIR$(basename "$f")
done
echo DONE!
