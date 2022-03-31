#!/bin/bash
cwd=`pwd`		# current working directory
cd `dirname $0`	# change to the directory where the script is located
BINDIR=`pwd`	# BINDIR: the directory where the script is located
cd $cwd		# return to the working directory
BASENAME=`basename $0`	# Set the script name (without path to it)
TMPDIR=/tmp/$BASENAME.$$	# Set a temporary directory if needed
ETCDIR=$BINDIR/../etc		# ETCDIR is the config directory
USERFORCREATEUSERSCRIPTPATH=$1 #Path of file directory create user.

. ../etc/backup.env.bash	# run config file “Scriptname”.env

IFS=$'\r\n' GLOBIGNORE='*' command eval  'groups=($(cat $Gruppendatei))'
groupssafed=( $(cut -d: -f1,3 /etc/group | tr '\n' ' ') )

while IFS=',' read field1 field2 field3
do

	if [ ! "$field1" == "" ] && [ ! "$field2" == "" ] && [ ! "$field3" == "" ] 
    then
		# do when field1 is not empty

        if ! grep -q $field1 /etc/passwd
        then
            if [[ " ${groups[*]} " =~ " ${field2} " ]]; 
            then
                # do when array contain value
                echo "Group $field2 is saved in  Backup-File"

            elif [[ ! " ${groups[*]} " =~ " ${field2} " ]];
            then
                # do when array dont contains value
             echo "Group $field2 is not saved in the Backup-File"

            fi
            
            if grep -q $field2 /etc/group
            then
                # do when group exists

                useradd -m -G $field2 $field1
                echo "User $field1 was created and added to Group $field2"
            else
                echo "Group $field2 does not exist, User $field1 will not get created!"
            fi
        else
            echo "User $field1 already exists. No user will be created"
        fi
	else
		echo "$field1, $field2, $field3 is invalid"
    fi
		

done < $1