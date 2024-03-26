#Dunia Jaser 1201345
#Raneem Daqa 1202093
echo "-----------------------------------------------------"
echo "Does the dictionary file exist or not? (yes/no)"
read answer

if [ "$answer" = yes ]
then
echo "Enter the path of dictionary file:"
read pathh
	if [ ! -e "$pathh" ]
	then
	ehco "Please check the path!"
	exit 1
	fi 
else
touch dictionary.txt
fi

if [ "$answer" = yes ]
then
dictionary=$(echo "$pathh")
else
dictionary=$(echo dictionary.txt)
fi

./menu "$dictionary"
