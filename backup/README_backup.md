## Question 1 - Backup Script
The script is able to backup the files from one directory to the other.
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

