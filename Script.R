#Load Data 
stest <- read.table("subject_test.txt") 
strain <- read.table("subject_train.txt") 
xtest <- read.table("X_test.txt") 
xtrain <- read.table("X_train.txt") 
ytest <- read.table("Y_test.txt") 
ytrain <- read.table("Y_train.txt") 
features <- read.table("features.txt") 
activity <- read.table("activity_labels.txt") 

#1.Merges the training and the test sets to create one data set.
xall <- rbind(xtrain, xtest) 
yall <- rbind(ytrain, ytest) 
sall <- rbind(strain, stest) 

merged <- cbind(sall,yall,xall)

#4.Appropriately labels the data set with descriptive variable names. 
names <- c("Subjects","Activity_No",as.character(features[,2]))
names(merged)<-names

#2.Extracts only the measurements on the mean and standard deviation for each measurement. 
col = c(1,2, grep("mean", names(merged)), grep("std", names(merged))) 
extract <- merged[, col] 

#3.Uses descriptive activity names to name the activities in the data set
names(activity) <- c("Activity_No","Activity")
extract$Activity_No <- activity$Activity[match(extract$Activity_No, activity$Activity_No)]
colnames(extract)[2] <- "Activity"

#Dataset 1 = extract
write.table(extract, file = "1st_tidy_data_set.txt", row.names = FALSE)

#5.From the data set in step 3, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(dplyr) 
data <- extract %>% group_by(Subjects, Activity) %>% summarise_each(funs(mean)) 

#Dataset 2 = data
write.table(data, file = "2nd_tidy_data_set.txt", row.name = FALSE) 
