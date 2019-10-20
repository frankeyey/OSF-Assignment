# OSF-Assignment
This is the assignment of CSC2104: OPERATING SYSTEM FUNDAMENTALS for August 19 semester. We are required to write a script for automatic backup and a script for evaluation of backup script.
## Question 1 - Backup Script
The script is able to backup the files from one directory to the other.

>*Please use ABSOLUTE path throughout the process.*
```{r}
======-|Welcome to FRANK's Exclusive Backup Service-|======
**NOTE: Please enter ABSOLUTE path. Example: /home/frank/Desktop/Assignment
```
Users can choose if they want to use a saved setting for backup.
* If no - Prompt users for source path and destination path.
```{r}
Do you want to choose a saved setting for backup? (Y/N): n
Enter source path: /home/frank/Desktop/a

Enter destination path: /home/frank/Desktop/Temp
```
* If yes - Saved settings will be listed for selection.
```{r}
Do you want to choose a saved setting for backup? (Y/N): y
first
Which saved setting to choose?:
```
After that, start the backup process. During the backup process:
* Without saved setting - Files will be copied to the destination and create a log file.
* With saved setting - Files will be copied to a new directory (with timestamp) inside destination and create a log file.
```{r}
Backup-ing....
Successfully backup.
```
Log file includes:
1. Timestamp
2. Source path and Destination path
3. Files copied

Example log file:
```{r}
2019-10-21_03-35-22
Backup from /home/frank/Desktop/a to /home/frank/Documents/Temp
Files backed up: a, mk, oh

2019-10-21_03-35-33
Backup from /home/frank/Desktop/a to /home/frank/Documents/Temp/2019-10-21_03-35-33
Files backed up: a, mk, oh
```

After backup process, user can choose to save the saved setting. They can name the saved setting and the settings will be stored in a directory called "savedsetting".
```{r}
Do you want to save the settings?(Y/N): y
Enter file name for saved setting: temp
Settings have been saved.
```

## Question 2 - Evaluation Script
The script is able to run and evaluate the backup script with different test cases.
1. Test Case 1 - Backup without using pre-configured settings (The script will be ran once)
2. Test Case 2 - Backup using pre-configured settings (The script wlll be ran twice. First without saved setting, Second with saved setting)
3. Test Case 3 - Customize test case (The script will be ran once. Users can set the settings themselves)

The script starts with prompting the users for source path and destination path to be tested. 
```{r}
-----This is to run and evaluate the backup script (backup_18081430.sh)...
**NOTE: Please enter ABSOLUTE path. Example: /home/frank/Desktop/Assignment

Which test case to be evaluated: 
  1 - Backup without using pre-configured settings
  2 - Backup using pre-configured settings
  3 - Customize test case
  4 - View Reports
  0 - Exit
Your choice:
```
Then, initialize the settings according to test cases. Next, run the backup script along with defined paths and settings. Finally, evaluate the process and generate a report. The report will be printed out users can also view the report from the main menu.

The report includes:
1. Date of evaluation
2. Time of evaluation
3. Source Path
4. Destination Path
5. Number of files in source
6. Files in source
7. Number of files in destination
8. Files in destination

Example report:
```{r}
     Report for evaluation
--------------------------------
Date of evaluation:		2019-10-21
Time of evaluation:		03-43-12
Source path:			/home/frank/Desktop/a
Destination path:		/home/frank/Desktop/wew
Number of files in source:	3
File(s) in source:		a  mk  oh
Number of files in destination:	3
File(s) in destination:		a  mk  oh


All files have been successfully backed up.
--------------------------------
```

Users can choose to evaluate another script after each test case ended.
```{r}
Do you want to perform another test? (Y/N):
```
