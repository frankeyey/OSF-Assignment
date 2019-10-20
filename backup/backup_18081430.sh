#!/bin/bash
#Backup with saved settings (Create a new directory with timestamp)
backupnewfile(){
	cd $dest
	backuptime="$(date +%Y-%m-%d_%H-%M-%S)"
        mkdir $backuptime
	dest=$dest/$backuptime
	cp -r $source"/." $dest
        timestamp >> ~/backup/log.txt
        echo "Backup from $source to $dest" >> ~/backup/log.txt
	printf "Files backed up: " >> ~/backup/log.txt
	ls -m $source >> ~/backup/log.txt
        echo >> ~/backup/log.txt
	printf "Backup-ing...."
	sleep 2s
	echo
	echo "Successfully backup."
}

#Normal backup
backup(){
	cp -r $source"/." $dest
        timestamp >> ~/backup/log.txt
        echo "Backup from $source to $dest" >> ~/backup/log.txt
	printf "Files backed up: " >> ~/backup/log.txt
	ls -m $source >> ~/backup/log.txt
	echo >> ~/backup/log.txt
	printf "Backup-ing...."
	sleep 2s
	echo
        echo "Successfully backup."
}

#Timestamp function
timestamp(){
	date +"%Y-%m-%d_%H-%M-%S"
}

#Create a "savedsetting" directory if there is no such directory
savedsettingdir(){
	if [ ! -d "savedsetting" ]; then
		mkdir ~/backup/savedsetting
	fi
}

#Write into log file (Fail backup)
backupfail(){
	timestamp >> ~/backup/log.txt
        echo "Fail to backup..." >> ~/backup/log.txt
	echo >> ~/backup/log.txt
}

#Configure which saved setting and start to backup
savedsetting(){
	savedsettingdir
	cd savedsetting
	ls
	read -p "Which saved setting to choose?: " savedfile
	while [ ! -f $savedfile ]; do	
		read -p "Which saved setting to choose?: " savedfile
		if [ -f $savedfile ]; then
			break
		fi
	done
	filename="$savedfile"
	while read a b; do
		source=$a dest=$b
	done < $filename
	cd ..

	backupnewfile
}

#Configure source path and destination path
xsavedsetting(){
	read -p  "Enter source path: " source
	while [ ! -d "$source" ]; do
		echo "$source not exist."
		read -p  "Enter source path: " source
		if [ -d "$source" ]; then
			break
		fi
	done
	echo	
	read -p "Enter destination path: " dest
	while [ ! -d "$dest" ]; do
		mkdir $dest
			
		if [ ! -d "$dest" ]; then
			read -p "Enter destination path: " dest
		elif [ -d "$dest" ]; then
			break
		fi
	done
	backup
}

#Title and instructons
header(){
	echo
	echo "======-|Welcome to FRANK's Exclusive Backup Service-|======"
	echo "**NOTE: Please enter ABSOLUTE path. Example: /home/frank/Desktop/Assignment"
	echo
}

main(){
	if  [ -z $saved ]; then
		header
		read -p "Do you want to choose a saved setting for backup? (Y/N): " saved
	fi

	if [ "$saved" = "Y" ] || [ "$saved" = "y" ]; then
		if [ -z $source ]; then
			savedsetting
		else
			backupnewfile
		fi
	
	elif [ "$saved" = "N" ] || [ "$saved" = "n" ]; then
		if [ -z $source ]; then		
			xsavedsetting
		else
			backup
		fi
		if [ -z $savemou ]; then
			read -p "Do you want to save the settings?(Y/N): " savemou
		fi		
		if [ $savemou = "y" ] || [ $savemou = "Y" ]; then
			read -p "Enter file name for saved setting: " savedsettingfile
			savedsettingdir
			cd savedsetting
			echo "$source $dest" >> "$savedsettingfile"
			echo "Settings have been saved."
			cd ..
		fi
	fi
}

main
