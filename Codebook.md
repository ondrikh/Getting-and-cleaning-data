Getting and cleaning data course project Codebook

This codebook describes informations about dataset and also describes all transformations and processes i made with it.

Original source for dataset is http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones and data can be downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

To perform all required operations, i made run_analysis.R script, which makes folllowing steps:
1.Loads all needed data files from downloaded and extracted zip file. From /train folder it is X_train, y_train and subject_train, from /test folder it is X_test, y_test and subject_test. Activity labesl and features are also loaded into R. Data can be merged together so X_* files are merged together via rbind function, same happens for y_* and subject_*.
2.There is totally  561 variables, but not all are needed and script only selects 66 of them - variables that have in its name std or mean. For selected variables renaming operations are made, meaning signs "(),-" are removed. mean and std are renamed to Mean and Std. First two letter in each variable name are renamed, to be more explicit - tB goes to Time_B, tG goes to Time_G and fB goes to Freq_B
