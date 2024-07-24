#Dunia Jaser 1201345
dictionary=$1
word=$2
compressedFile=$3

isWordExists=$(grep -w "$word" $dictionary)
status=$?

#word is existed in dictionary
if [ $status == 0 ]
then

checkPoint=$(grep -w "\." $dictionary | cut -d' ' -f2)
s=$?

if [ "$checkPoint" == "$word" ]
then
	index1=$(grep -wn "\." $dictionary | cut -d':' -f1)
	index1=$((index1 - 1))
	hexa1=$(printf "0x%04x" "$index1")
	echo "$hexa1" "$word"
	echo "$hexa1" >> $compressedFile
	
else
	index=$(grep -wn "$word" $dictionary | cut -d':' -f2 | cut -d' ' -f1)
	echo "$index" "$word"
	echo "$index" >> $compressedFile

fi

fi
echo -------------------------------
