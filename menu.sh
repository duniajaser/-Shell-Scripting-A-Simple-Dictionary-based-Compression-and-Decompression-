#Dunia Jaser 1201345

if [ "$#" -ne 1 ]
then 
	echo "There is a problem in menu!"
	exit 1
fi

dictionary=$1

echo "------------------------Menu-------------------------"
echo "c) Compress the file"
echo "d) Decompress the file"
echo "e) Exit the program"

read option

if [ "$option" = c -o "$option" = C ]
then
	echo "Enter the path of the file to be compressed:"
	read file
	if [ ! -e "$file" ]
        then
        echo "Please check the path!"
	exit 1
        fi
	./compress "$dictionary" "$file"	
elif [ "$option" = d -o "$option" = D ]
then
echo "Enter the path of the file to be decompressed:"
	read file
	if [ ! -e "$file" ]
        then
        ehco "Please check the path!"
	exit 1
        fi
	./decompress "$dictionary" "$file"
elif [ "$option" = e -o "$option" = E ]
then
	echo " Thank you ^_^ "
	exit 0
else
echo "Not a valid choice!"
fi
