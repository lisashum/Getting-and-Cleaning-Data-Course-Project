#**Getting and Cleaning Data Course Project**

###**A. Project Objective**
<p align="justify">The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set.</p>

###**B. Getting Started**

<p align="justify">The data used in this project can be downloaded using the link below:</p>

The files used are:

* subject_test.txt 
* subject_train.txt 
* X_test.txt 
* X_train.txt 
* Y_test.txt 
* Y_train.txt 
* features.txt
* activity_labels.txt

###**C. Step-By-Step Guide To Create Two Tidy Independent Datasets**

**Step 1:**
<p align="justify">The data from following files are first loaded into R and merged into a single temporary dataset using  cbind and rbind functions:</p>

* subject_test.txt 
* subject_train.txt 
* X_test.txt 
* X_train.txt 
* Y_test.txt 
* Y_train.txt 

```{r}
xall <- rbind(xtrain, xtest) 
yall <- rbind(ytrain, ytest) 
sall <- rbind(strain, stest) 
merged <- cbind(sall,yall,xall)
```

**Step 2:**
<p align="justify">This first temporary dataset is then appropriately labeled with descriptive variable names found in features.txt.</p>

```{r}
names <- c("Subjects","Activity_No",as.character(features[,2]))
names(merged)<-names
```

**Step 3:**
<p align="justify">A second temporary dataset is then created by extracting only the measurements on the mean and standard deviation for each measurement from the first temporary dataset.</p>

```{r}
col = c(1,2, grep("mean", names(merged)), grep("std", names(merged))) 
extract <- merged[, col] 
```

**Step 4:**
<p align="justify">The first tidy dataset is then created after descriptive activity names found in activity_labels.txt are used to name the activities in the second temporary data set. The R script generates the **first tidy dataset with file name "1st_tidy_dataset.txt"**</p>

```{r}
names(activity) <- c("Activity_No","Activity")
extract$Activity_No <- activity$Activity[match(extract$Activity_No, activity$Activity_No)]
colnames(extract)[2] <- "Activity"
write.table(extract, file = "1st_tidy_data_set.txt", row.names = FALSE)
```

**Step 5:**
<p align="justify">The second independent tidy dataset is then created by averaging each variable for each activity and each subject. The R script generates the **second tidy dataset with file name "2nd_tidy_dataset.txt"**</p>

```{r}
library(dplyr) 
data <- extract %>% group_by(Subjects, Activity) %>% summarise_each(funs(mean)) 
write.table(data, file = "2nd_tidy_data_set.txt", row.name = FALSE) 
```