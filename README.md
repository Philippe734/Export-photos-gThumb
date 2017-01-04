# export-photos-gthumb
Script for gThumb to export a photo album

Script for gThumb under Linux.

This script allows to export a photo album (folder) while preserving the original size and compressing the photos.os.

Compresses all the photos in a folder (album) keeping their original size.

Modify these variables to suit to your needs
Quality = compress ratio, for example 50
TargetDirPath = the output path of the album, keeping the folder name (album).

Install and setup :
With gThum, clic Tools, then select Custom.
Clic New, then set a name as Export photo album.
Then, in the command line, set the path to the script and add %P
Name : Export photo album
Command : /home/user/Documents/Scripts/Export_photo_album_gThumb.sh %P

Use
With gThumb, select a photo album on the left, then select a photo on the right (any). Then, open Tools and select Export photo album. The script will export the photos of the folder to the path specified in TargetDirPath keeping the album name. The photos will be compress following the ratio Quality and their keep the original size.

