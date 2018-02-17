#Code Book

<p align="justify">This codebook describes the variables, data, and transformations used to clean up the data used for the Getting and Cleaning Data Course.</p>

##**A. Variables**

<p align="justify">Information on feature variables can be found in feature_info.txt file that can be downloaded using the link below:</p>

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The following are extracted from the file:

There are a total of 561 time and frequency domain feature variables.

<p align="justify">The feature variables come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.</p>

<p align="justify">Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).</p>

<p align="justify">Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).</p> 

<p align="justify">These signals were used to estimate variables of the feature vector for each pattern:  </p> 

<p align="justify">'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.</p>

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

<p align="justify">Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:</p>

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

##**B. Data**

The data used for this project can be downloaded using the link below:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

<p align="justify">The data comprises the 3-axial linear acceleration and 3-axial angular velocity of 30 volunteers who have performed six activities (walking, walking up the stairs, walking down the stairs, sitting, standing and laying) as recorded by the Samsung Galaxy SII they wore on their waist while performing the activity. The dataset has been random partitioned into 2 sets, whereby 70% of volunteers were selected for generating the training data, and the remaining for generating the test data.</p>

<p align="justify">For more details, please refer to readme.txt file contained within the zipped file.</p>

##**C. Transformations**

The following transformations are done to create two independent tidy data sets:

**Step 1:**
<p align="justify">The data from following files are first loaded into R and merged into a single temporary dataset using  cbind and rbind functions:</p>

* subject_test.txt 
* subject_train.txt 
* X_test.txt 
* X_train.txt 
* Y_test.txt 
* Y_train.txt 

**Step 2:**
<p align="justify">This first temporary dataset is then appropriately labeled with descriptive variable names found in features.txt.</p>

**Step 3:**
<p align="justify">A second temporary dataset is then created by extracting only the measurements on the mean and standard deviation for each measurement from the first temporary dataset.</p>

**Step 4:**
<p align="justify">The first tidy dataset is then created after descriptive activity names found in activity_labels.txt are used to name the activities in the second temporary data set. The R script generates the **first tidy dataset with file name "1st_tidy_dataset.txt"**</p>

**Step 5:**
<p align="justify">The second independent tidy dataset is then created by averaging each variable for each activity and each subject. The R script generates the **second tidy dataset with file name "2nd_tidy_dataset.txt"**</p>


