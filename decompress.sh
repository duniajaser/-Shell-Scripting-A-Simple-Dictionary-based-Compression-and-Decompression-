#Dunia Jaser 1201345

if [ "$#" -ne 2 ]
then 
	echo "There is a problem in the file to be decompressed!"
	exit 1
fi

file=$2
dictionary=$1
#cut is used because wc -w return also the name of th file 
numOfLines=$(wc -l $file | cut -d' ' -f1)

touch uncompressed.txt
echo -n "" > uncompressed.txt
line=1

while [ "$numOfLines" -gt 0 ]
do 
code=$(sed -n "${line}p" $file)

isWordExists=$(grep -w "$code" $dictionary)
status=$?

if [ status == 1 ]
then
	echo "Error, $code is not existed in the dictionary!"
else
word=$(grep -w "$code" $dictionary | cut -d' ' -f2)
length=${#word}
	if [ $length -gt 0 ]
	then
	if [ $word == "Space" ]
	then
	echo -n " " >> uncompressed.txt
	echo -n " " 
	elif [ $word == "\n" ]
	then
	echo >> uncompressed.txt
	echo 
	else
	echo -n "$word" >> uncompressed.txt
	echo -n "$word"
	fi
	else
	echo
	echo ---------------------
	echo "Error, $code is not existed in the dictionary!"
	echo ---------------------
	fi
fi		
numOfLines=$((numOfLines - 1))
line=$((line + 1))
done
echo 
./menu "$dictionary"
