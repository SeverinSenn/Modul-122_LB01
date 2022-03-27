#!/bin/bash
cwd=`pwd`		# current working directory
cd `dirname $0`	# change to the directory where the script is located
BINDIR=`pwd`	# BINDIR: the directory where the script is located
cd $cwd		# return to the working directory
BASENAME=`basename $0`	# Set the script name (without path to it)
TMPDIR=/tmp/$BASENAME.$$	# Set a temporary directory if needed
ETCDIR=$BINDIR/../etc		# ETCDIR is the config directory
USERFORCREATEUSERSCRIPTPATH='/home/M122/m122_praxisarbeit_ihre_Pisani-Senn/praxisarbeit/etc/' #Path of file directory create user.

. ../etc/backup.env.bash	# run config file “Scriptname”.env

IFS=$'\r\n' GLOBIGNORE='*' command eval  'groups=($(cat $Gruppendatei))'
groupssafed=( $(cut -d: -f1,3 /etc/group | tr '\n' ' ') )

while IFS=',' read field1 field2 field3
do
	if [ ! "$field1" == "" ] && [ ! "$field2" == "" ] && [ ! "$field3" == "" ] 
    then
		# do when field1 is not empty
        if [[ " ${groupssafed[*]} " =~ " ${field2} " ]];
        then
            # do when field2 is already a group
            echo "group exists"

            if [[ " ${groups[*]} " =~ " ${field2} " ]]; 
            then
                # do when array contain value
    
                useradd -d /home/$field2 $field1
                groupmod -n $field2 $field1
                echo "Group is saved in  Backup-File"
            elif [[ ! " ${groups[*]} " =~ " ${field2} " ]];
            then
                # do when array dont contains value

                useradd -d /home/$field2 $field1
                groupmod -n $field2 $field1
             echo "Group is not saved in the Backup-File. In User-Home not saved."
            fi
        fi
	else
		echo "$field1, $field2, $field3 is invalid"
    fi
		

done < /home/M122/m122_praxisarbeit_ihre_Pisani-Senn/praxisarbeit/etc/UsersForCreateUserScript.txt