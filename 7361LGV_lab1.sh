#!/bin/bash
echo "This program show current directory and hard links of the entered file"
echo "Developer: Lazareyt Georgy"
echo "Current directory:" $PWD
cnt1=3
cnt2=3
cnt3=3
while :
do
while :
do
echo "Enter file name:"
read file
if [[ -e "$file" ]]
then
	echo "$file exist"
	break
else
	echo  "$file doesn't exist" 1>&2
	echo "File doesn't exist, do you want to continue <y/n>?"
	while :
	do
	read option
	if [[ $option =~ ^[Yy]$ ]]
	then
		cnt1=3
		break
		
	elif [[ $option =~ ^[Nn]$ ]]
	then
		echo "Goodbye!"
		exit 0
	elif [[ ! $option =~ ^[Yy]$ ]] || [[ ! $option =~ ^[Nn]$ ]]
	then
		((cnt1-=1))
		echo "Error! You can only use <Y,y> to continue or <N,n> to exit. Attempts remaning: $cnt1" 1>&2
		if [[ $cnt1 == 0 ]]
		then
			echo "You have made 3 errors, exiting" 1>&2
			exit 120
			fi
		fi
	done		
fi
done
echo "Do you want to see hardlinks of the file <y/n>?"
while :
do
read ans
if [[ $ans =~ ^[Yy]$ ]] 
then
echo "The number of file links"
ls -li $file
echo "File Link Names" 
find / -xdev -samefile $file
break
elif [[ $ans =~ ^[Nn]$ ]] 
then 
	echo "Exiting, Goodbye!"
	exit 0
elif [[ ! $ans =~ ^[Y,y]$ ]] || [[ ! $ans =~ ^[N,n]$ ]]
then 
	((cnt3-=1))
	echo "Error! You can only use <Y,y> to continue or <N,n> to exit. Attemps remaning $cnt3" 1>&2
	if [[ $cnt3 == 0 ]]
	then
		echo "You have made 3 errors, exiting" 1>&2
		exit 120
		fi
	fi
done
echo "Do you want to continue work <y/n>?"
	while :
	do
	read opt
	if [[ $opt =~ ^[Yy]$ ]]
	then
		break
		
	elif [[ $opt =~ ^[Nn]$ ]]
	then
		echo "Goodbye!"
		exit 1
	elif [[ ! $opt =~ ^[Yy]$ ]] || [[ ! $opt =~ ^[Nn]$ ]]
	then
		((cnt2-=1))
		echo "Error! You can only use <Y,y> to continue or <N,n> to exit. Attempts remaning $cnt2" 1>&2
		if [[ "$cnt2" == 0 ]]
		then
			echo "You have made 3 errors, exiting" 1>&2	
			exit 120
			fi
		fi

	done	

done
