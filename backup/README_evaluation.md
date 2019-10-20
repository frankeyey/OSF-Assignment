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
