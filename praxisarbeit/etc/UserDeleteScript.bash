#!/bin/bash
while IFS=',' read field1 field2 field3
do
	if [ ! "$field1" == "" ]
		then
            userdel $field1
			groupdel $field2
	else
			echo "$field1, $field2, $field3 is invalid"
		fi

done < /home/M122/m122_praxisarbeit_ihre_Pisani-Senn/praxisarbeit/etc/UsersForCreateUserScript.txt


