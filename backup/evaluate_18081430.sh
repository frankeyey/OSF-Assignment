#Get the source path and destination path
getbackupinfo(){
	echo
	read -p  "Enter the source path: " source
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
}

#Write report into file with timestamp
report(){
	createreportdir
	reportpath=~/backup/report/$backuptime"_Report"
	echo "     Report for evaluation" >> $reportpath
	echo "--------------------------------" >> $reportpath
	printf "Date of evaluation:		" >> $reportpath
	printf $datedate >> $reportpath
	echo >> $reportpath
	printf "Time of evaluation:		" >> $reportpath
	printf $time >> $reportpath
	echo >> $reportpath
	echo "Source path:			$source" >> $reportpath
	echo "Destination path:		$dest" >> $reportpath
	printf "Number of files in source:	" >> $reportpath
	ls $source | wc -l >> $reportpath
	printf "File(s) in source:		" >> $reportpath
	ls -m $source >> $reportpath
	printf "Number of files in destination: " >> $reportpath
	ls $dest | wc -l >> $reportpath
	printf "File(s) in destination:		" >> $reportpath
	ls -m $dest >> $reportpath
	echo >> $reportpath
	if [ "$?" = "0" ]; then
		echo
	        echo "All files have been successfully backed up." >> $reportpath
	else
        	echo "File(s) that has not been backing up: " >> $reportpath
        	diff $source $dest >> $backuptime"_Report"
	fi
	echo "--------------------------------" >> $reportpath
}

#Create a "report" directory if there is no such directory
createreportdir(){
	if [ ! -d ~/backup/report ]; then
		mkdir ~/backup/report
	fi
}

#Print report
evaluate(){
	datedate="$(date +%Y-%m-%d)"
	time="$(date +%H-%M-%S)"
	echo
	read -p "Press ENTER to show the evaluation results."
	echo
	echo "     Report for evaluation"
	echo "--------------------------------"
	printf "Date of evaluation:		"
	printf $datedate
	echo
	printf "Time of evaluation:		"
	printf $time
	echo
	echo "Source path:			$source"
	echo "Destination path:		$dest"
	printf "Number of files in source:	"
	ls $source | wc -l
	printf "File(s) in source:		"
	ls $source
	printf "Number of files in destination:	"
	ls $dest | wc -l
	printf "File(s) in destination:		"
	ls $dest
	echo
	if [ "$?" = "0" ]; then
		echo
	        echo "All files have been successfully backed up."
	else
        	echo "File(s) that has not been backing up: "
        	diff $source $dest
	fi
	echo "--------------------------------"
	echo
	report
	echo "You can view the reports from the main menu."
	echo
}

#Title and instructions
header(){
	echo "-----This is to run and evaluate the backup script (backup_18081430.sh)..."
        echo "**NOTE: Please enter ABSOLUTE path. Example: /home/frank/Desktop/Assignment"
	echo
}

#Test Cases
testing(){
	echo "Which test case to be evaluated: "
	echo "  1 - Backup without using pre-configured settings"
	echo "  2 - Backup using pre-configured settings"
	echo "  3 - Customize test case"
	echo "  4 - View Reports"
	echo "  0 - Exit"
	read -p "Your choice: " testcase
	
	notvalid=true
	while $notvalid; do
	        if [ "$testcase" = "1" ] || [ "$testcase" = "2" ] || [ "$testcase" = "3" ] || [ "$testcase" = "4" ]|| [ "$testcase" = "0" ]; then
	                break
	        else    
	                read -p "Please enter a valid input: " testcase
	        fi
	done
	backuptime="$(date +%Y-%m-%d_%H-%M-%S)"
	if [ $testcase = "1" ]; then
	        getbackupinfo
	        saved="n"
	        savemou="n"
	        . backup_18081430.sh $saved $source $dest $savemou
	        evaluate
	elif [ $testcase = "2" ]; then
	        getbackupinfo
	        saved="n"
	        savemou="y"
	        . backup_18081430.sh $saved $source $dest $savemou
	        evaluate
	        read -p "Press ENTER to continue evaluating."
	        echo "For this testing, we will be using the saved setting you created just now ($savedsettingfile)"
	        saved="y"
	        . backup_18081430.sh $saved $source $dest $savemou
	        evaluate
	elif [ $testcase = "3" ]; then
	        . backup_18081430.sh
	        evaluate
	elif [ $testcase = "4" ]; then
		echo
		ls ~/backup/report
		read -p "Which report to view?: " viewreport
		echo		
		cat ~/backup/report/$viewreport
	elif [ $testcase = "0" ]; then
	        exit
	fi
	
	read -p "Do you want to perform another test? (Y/N): " again
	while $notvalid; do
	        if [ "$again" = "y" ] || [ "$again" = "Y" ] || [ "$again" = "n" ] || [ "$again" = "N" ]; then
	                break
	        else    
	                read -p "Please enter a valid input: " again
	        fi
	done
	echo
	if [ $again = "y" ] || [ $again = "Y" ]; then
	        testing
	elif [ $again = "n" ] || [ $again = "N" ]; then
	        exit
	fi
}

main(){
	header
	testing
}

main
