#!/bin/bash
DirName=$(basename "$@")

#Compress all pictures to quality :
Quality=50

# Destination:
TargetDirPath="$HOME/Export/Compressed/$DirName"

notify-send "Begin process..." $DirName

if [ ! -d "$TargetDirPath" ]
then
    mkdir -p "$TargetDirPath"
fi

TotalFiles=$(ls $@ -1 | wc -l)

(for file in "$@"/*; do
	TYPE_MIME=$(file -bi "$file")
	TYPE="${TYPE_MIME%;*}"
	ShortName=$(basename "$file")

	if [ "${TYPE%/*}" = "image" ]; then
		convert "$file" -quality $Quality "$TargetDirPath/$ShortName"
	fi
	
	((i++))

	# Calculate the percentage of the file with bc function because floating
	P=`echo "scale=2 ; $i/$TotalFiles" | bc`
	P=`echo "scale=0 ; $P*100" | bc`
	P=`echo "($P+0.5)/1" | bc`

	echo $P # << used to increment the progress bar

	echo "# Album $DirName, photo #$i" # << used to display a text in the progress dialog

done) | zenity --progress --auto-close --title="Process..."

notify-send "Done" $DirName

exit 0

