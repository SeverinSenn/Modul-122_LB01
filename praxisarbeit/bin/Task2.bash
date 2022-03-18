#!/bin/bash
cwd=`pwd`		# current working directory
cd `dirname $0`	# change to the directory where the script is located
BINDIR=`pwd`	# BINDIR: the directory where the script is located
cd $cwd		# return to the working directory
BASENAME=`basename $0`	# Set the script name (without path to it)
TMPDIR=/tmp/$BASENAME.$$	# Set a temporary directory if needed
ETCDIR=$BINDIR/../etc		# ETCDIR is the config directory

. ../etc/backup.env.bash	# run config file “Scriptname”.env

if [ `whoami` != root ]; then
    echo Please run this script as root or using sudo
    exit
fi

IFS=$'\r\n' GLOBIGNORE='*' command eval  'groups=($(cat $Gruppendatei))'

gruppen=()
for group in ${groups[@]}
do
  if grep -q $group /etc/group
    then
         gruppen+=($group)
    else
         echo "Warning: Gruppe $group existirt nicht"
    fi
done

users=()
for group in ${gruppen[@]}
do
    userslist=$(sudo groupmems -g $group -l)
    for user in ${userslist[@]}
    do 
        if [[ ! " ${users[@]} " =~ " ${user} " ]]; then
            users+=($user)
        fi
    done
done

if [ ! -d $BackupPath ]; then
  mkdir $BackupPath
fi

filesInBackupFolder=($(ls -tr $BackupPath))
while  (( ${#filesInBackupFolder[@]} >= $BackupLimit )) 
do
    sudo rm "$BackupPath/${filesInBackupFolder[0]}"
    echo "Removed File ${filesInBackupFolder[0]}"
    filesInBackupFolder=($(ls -tr $BackupPath))
done

usersDirechtory=()
for user in ${users[@]}
do
    usersDirechtory+=("/home/$user")
done

d=`date +%Y-%m-%d-%H-%M`
tarfilename="$BackupPath/${TarPrefix}_${d}"
tar cfP $tarfilename ${usersDirechtory[@]}

echo "${TarPrefix}_${d} wurde erstellt"
