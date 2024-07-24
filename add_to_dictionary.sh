#Dunia Jaser 1201345

dictionary=$1
word=$2
index=0

if [ -s $dictionary ]
then
index=$(wc -l $dictionary | cut -d' ' -f1)
fi

isWordExists=$(grep -w "$word" $dictionary)
status=$?

#word is not existed in dictionary
if [ $status == 1 ]
then
non_charac1=$(echo "$word" | grep -q '\.')
exitStatus11=$?
	if [ $exitStatus11 == 0 ]
	then
	isWordExists1=$(grep "\." $dictionary)
	status1=$?
	if [ $status1 == 1 ]
	then
	hexa=$(printf "0x%04X" "$index")
	echo "$hexa" "." >> $dictionary	
	fi
	fi
	if [ $exitStatus11 == 1 ]
	then
	hexa=$(printf "0x%04X" "$index")
	echo "$hexa" "$word" >> $dictionary
	fi
fi
