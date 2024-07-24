#Dunia Jaser 1201345

if [ "$#" -ne 2 ]
then 
	echo "There is a problem in the file to be compressed!"
	exit 1
fi

file=$2
dictionary=$1

#cut is used because wc -w return also the name of th file 
numOfLines=$(wc -l $file | cut -d' ' -f1)
#------------------------------------------------
touch compressed.txt
echo -n "" > compressed.txt
line=1
linesNum=$(wc -l $file | cut -d' ' -f1)
while [ "$numOfLines" -gt 0 ]
do 
line1=$(sed -n "${line}p" $file)
field_count=$(echo "$line1" | tr -cd " " | wc -c)
field_count=$((field_count + 1))

current_field=1
	while [ "$field_count" -gt 0 ]
	do
	word=$(echo "$line1" | cut -d' ' -f"$current_field")
	new_word=$(echo "$word" | sed 's/[^[:alnum:]]//g')
	./add_to_dictionary "$dictionary" "$new_word"
	./add_to_comprssedFile "$dictionary" "$new_word" compressed.txt
	non_charac=$(echo "$word" | sed 's/[[:alnum:]]//g')
	
	length=${#non_charac}
	if [ $length -gt 0 ]
	then
	if [ "$non_charac" == "." ]
	then
	x=$(echo ".")
		./add_to_dictionary "$dictionary" "$x"
		./add_to_comprssedFile "$dictionary" "$x" compressed.txt
	else
	./add_to_dictionary "$dictionary" "$non_charac"
	./add_to_comprssedFile "$dictionary" "$non_charac" compressed.txt
	fi
	fi
	
		
	if [ $field_count -ne 1 ]
	then
	y=$(echo "Space")
	./add_to_dictionary "$dictionary" "$y"
	./add_to_comprssedFile "$dictionary" "$y" compressed.txt
	
	fi
	
	field_count=$((field_count - 1))
	current_field=$((current_field + 1))
	done
if [ $line -ne $linesNum ]
then
./add_to_dictionary "$dictionary" "\n"
./add_to_comprssedFile "$dictionary" "\n" compressed.txt
fi
		
numOfLines=$((numOfLines - 1))
line=$((line + 1))
done
#wc -c count the \n character, but the last one is not needed
numOfCharac=$(wc -c $file | cut -d' ' -f1)
numOfCharac=$((numOfCharac - 1))
uniCodeSize=16
uncompressedFileSize=$(expr $numOfCharac \* $uniCodeSize)
echo "The uncompressed file size = $uncompressedFileSize bits = $((uncompressedFileSize/8)) Bytes"
echo -------------------------------
numOfCodes=$(wc -l compressed.txt | cut -d' ' -f1)
compressFileSize=$(expr $numOfCodes \* $uniCodeSize)
echo "The compressed file size = $compressFileSize bits = $((compressFileSize/8)) Bytes"
echo -------------------------------
#the only way to get the float value is using awk.
fileCompressionRatio=$(awk "BEGIN { printf \"%.3f\",$uncompressedFileSize / $compressFileSize}")

echo "File Compression Ratio = $fileCompressionRatio"
echo -------------------------------
./menu "$dictionary"
