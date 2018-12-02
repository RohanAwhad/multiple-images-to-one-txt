#!/bin/bash


files=(*.png) #this selects every png file in the folder. If you want to select all files just delete the extension or change it as per your requirements
for file in "${files[@]}"; do
	echo "Cleaning $file"
	echo " "
	bash ../textcleaner -g -e stretch -f 25 -o 20 -s 1 "$file" "textclean_$file"
	
	echo "Resizing textclean_$file"
	convert "textclean_$file" -resize 7000x7000 "resize_$file"
	
	echo " "
	echo "Recognizing text from resize_$file"
	echo " " 
	tesseract "resize_$file" a
	cat a.txt >> op.txt
done

rm text*
rm resize*
rm a.txt
cat op.txt


