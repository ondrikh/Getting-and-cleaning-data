#This script runs required operations to manage given data for further analysis.
#1. At first we need to load data files and label files into R and merge them together
  #a. loading training data
traindata<-read.table("dataset/train/X_train.txt")
trainlab<-read.table("dataset/train/y_train.txt")
trainsub<-read.table("dataset/train/subject_train.txt")
  #b. loading test data
testdata<-read.table("dataset/test/X_test.txt")
testlab<-read.table("dataset/test/y_test.txt")
testsub<-read.table("dataset/test/subject_test.txt")
  #c. last but not least loading features and activity labels (will be used in later steps)
features<-read.table("dataset/features.txt")
activity<-read.table("dataset/activity_labels.txt")
  #d. mergin data together
data <- rbind(traindata, testdata)
lab <- rbind(trainlab, testlab)
sub <- rbind(trainsub, testsub)


library("dplyr") #loading dplyr package for usage in step 5
  

#2. Next step will "extract only the measurements on the mean and standard 
# deviation for each measurement". This is where features will be used. It contains total of 561
# rows and 2 columns, where first column is only variable number (1,2,3...) and second column is feature name.
  # a. Now focusing on columns containing "mean" or "std".

stdmean<-grep("mean\\()|std\\()", features[,2],value=FALSE) #choosing features variable numbers for mean and std
stdmean2<-grep("mean\\()|std\\()", features[,2],value=TRUE) #now features names
  # b. Renaming variable names into more compact form (i.e. removing some shitty symbols like "(" or "-" ) 
stdmean2<-gsub("-","",stdmean2) # killing "-"
stdmean2<-gsub("\\(\\)","",stdmean2) # killing "()"

stdmean2<-sub("tB","Time_B",stdmean2)
stdmean2<-sub("tG","Time_G",stdmean2)
stdmean2<-sub("fB","Freq_B",stdmean2)

stdmean2<-sub("mean","_Mean_",stdmean2)
stdmean2<-sub("std","_Std_",stdmean2)
stdmean2<-sub("_$","",stdmean2)


  
data2<-data[,stdmean] #data2 contains all rows from data and only columns that match for mean and st feature variables
colnames(data2)<-stdmean2 #appropriate column names used


#3. Third step - name activities in data set using descriptive activity names
activity[, 2] <- tolower( activity[, 2]) #lower cases activity names

activitylab <- activity[lab[, 1], 2]
lab[, 1] <- activitylab
colnames(lab)<-"activity"

colnames(sub)<-"subject"

finaldata<-cbind(sub,lab,data2)
#head(finaldata)
write.table(finaldata,"dataset/final_data.txt", row.name=FALSE)

#5. From the data set in step 4, creates a second, independent tidy data set with the 
# average of each variable for each activity and each subject.
tidy<-tbl_df(finaldata)
tidy<-group_by (tidy,activity,subject)%>%
      summarise_each (funs(mean))

write.table(tidy,"dataset/tidy_data.txt",row.name = FALSE)





