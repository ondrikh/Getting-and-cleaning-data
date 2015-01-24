# Getting-and-cleaning-data Coursera Project
This readme describes how to use run_analysis.R script to perform some basic operations with UCI HAR Dataset

1. Unzip the data from link https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. The run_analysis.R file should be placed in folder you extracted from .zip file
3. Set your working directory to the folder you just extracted
4. Use source("run_analysis.R") to run the script
5. Script created 2 files. First file named final_data.csv contains merged data set. File tidy_data.txt contains tidy data with means for each subject and each activity
6. You can use read.table("tidy_data.txt") to read data into R.
