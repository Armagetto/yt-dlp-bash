#!/bin/bash

echo "Youtube Downloader"
echo " "

cd ~/storage/shared/Download/yt-dlp
echo "Url: "
read url
yt-dlp $url --list-formats
echo "Type a format(n for defult video): "
read format
echo "Use sponsorblock(y/n): "
read sponsorblock

if [ $format = "n" ];
then
	if [ $sponsorblock = "y" ];
	then
		yt-dlp $url --sponsorblock-remove all
	fi

	if [ $sponsorblock = "n" ];
	then
		yt-dlp $url
	fi

else

	if [ $sponsorblock = "y" ];
	then
		yt-dlp -f $format $url --sponsorblock-remove all
	fi


	if [ $sponsorblock = "n" ];
	then
		yt-dlp -f $format $url
	fi

fi
