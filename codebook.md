# Peer-graded Assignment: Getting and Cleaning Data Course Project


The run_analysis.R script performs the data preparation and then followed by the 5 steps required as described in the course project’s instructions.

# 1.Loading required packages

* List of loaded required package(s)  : plyr


# 2.Download the zip file

* Downloaded Zip file after checking existence of the file
* Extracted under the folder called UCI HAR Dataset after checking the folder existence


# 3.Read and load data

* activitylabel <- activity_labels.txt : 6 rows, 2 columns
* List of activities' label performed when the corresponding measurements were taken.
* 
* featureslist <-  features.txt : 561 rows, 2 columns
* List of features
* 
* xtrain <- /UCI HAR Dataset/train/X_train.txt : 7352 rows, 561 columns
* contains train data of recorded features 
* 
* ytrain <- /UCI HAR Dataset/train/y_train.txt : 7352 rows, 1 columns
* contains train data of activities’ labels
* 
* subjecttrain <- /UCI HAR Dataset/train/subject_train.txt : 7352 rows, 1 column
* contains train data of subjects who performed the activity  
* 
* xtest <- /UCI HAR Dataset/test/X_test.txt : 2947 rows, 561 columns
* contains test data of recorded features
* 
* ytest <- /UCI HAR Dataset/test/y_test.txt : 2947 rows, 1 columns
* contains test data of activities’ labels
* 
* subjecttest <- /UCI HAR Dataset/test/subject_test.txt : 2947 rows, 1 column
* contains test data of subjects who performed the activity 


# 4.Merges the training and the test sets to create one data set

* ucidataset - 10299 rows, 561 columns 
* Full Dataset, created by merging xtrain and xtest using rbind function()
* 
* activityset - 10299 rows, 1 column
* Full set of activities' labels, created by merging ytrain and ytest using rbind function()
* 
* subjectset - 10299 rows, 1 column
* Created by merging subjecttrain and subjecttest using rbind function()


# 5.Uses descriptive activity names to name the activities in the data set

* activitysetwithlabel - 10299 rows, 2 columns
* Links the activities' labels with their activity name  using join() function
* 
* mergeddataset - 10299 rows, 563 columns
Created mergeddataset by binding activity Name (Column V2 from activitysetwithlabel) and  Subject code (Column V1 from subjectset)  to the ucidataset using cbind() function


# 6.Extracts only the measurements on the mean and standard deviation for each measurement. 

* tidysubset - 10299 rows, 88 columns 
* Created a subset of mergeddataset by selecting only measurements on the mean and std (standard deviation) for each measurement
* Extracted column index that match mean or std wordings in features list using grep() function
* Selected subset based on extracted index positions.
* In addition to those measurements,selected activity name and subject


# 7.Appropriately labels the data set with descriptive variable names. 

* All Acc in column's name in tidydataset replaced by Accelerometer
* All Gyro in column's name in tidydataset replaced by Gyroscope
* All BodyBody in column's name tidydataset replaced by Body
* All Mag in column's name tidydataset replaced by Magnitude
* All start with character f in column's name tidydataset replaced by Frequency
* All start with character t in column's name tidydataset replaced by Time


# 8.Independent tidy data set with the average of each variable for each activity and each subject

* secondtidydataset - 86 rows, 180 columns
* secondtidydataset, is a summarized set from the tidydataset taking the means of each variable for each activity and each subject, after grouped by subject and activity.
* 
* final_tidydataset - 180 rows, 86 coloumns
* final_tidydataset created by transposing secondtidydataset


# 9.Export FinalData into .txt file

* final_tidydataset wrote into text file using write.table() function

# List of variables in the final tidy data set
* Number of variables : 86
* Datatype of all variables - Numeric
*
*
* TimeBodyAccelerometer-mean()-X
* TimeBodyAccelerometer-mean()-Y
* TimeBodyAccelerometer-mean()-Z
* TimeBodyAccelerometer-std()-X
* TimeBodyAccelerometer-std()-Y
* TimeBodyAccelerometer-std()-Z
* TimeGravityAccelerometer-mean()-X
* TimeGravityAccelerometer-mean()-Y
* TimeGravityAccelerometer-mean()-Z
* TimeGravityAccelerometer-std()-X
* TimeGravityAccelerometer-std()-Y
* TimeGravityAccelerometer-std()-Z
* TimeBodyAccelerometerJerk-mean()-X
* TimeBodyAccelerometerJerk-mean()-Y
* TimeBodyAccelerometerJerk-mean()-Z
* TimeBodyAccelerometerJerk-std()-X
* TimeBodyAccelerometerJerk-std()-Y
* TimeBodyAccelerometerJerk-std()-Z
* TimeBodyGyroscope-mean()-X
* TimeBodyGyroscope-mean()-Y
* TimeBodyGyroscope-mean()-Z
* TimeBodyGyroscope-std()-X
* TimeBodyGyroscope-std()-Y
* TimeBodyGyroscope-std()-Z
* TimeBodyGyroscopeJerk-mean()-X
* TimeBodyGyroscopeJerk-mean()-Y
* TimeBodyGyroscopeJerk-mean()-Z
* TimeBodyGyroscopeJerk-std()-X
* TimeBodyGyroscopeJerk-std()-Y
* TimeBodyGyroscopeJerk-std()-Z
* TimeBodyAccelerometerMagnitude-mean()
* TimeBodyAccelerometerMagnitude-std()
* TimeGravityAccelerometerMagnitude-mean()
* TimeGravityAccelerometerMagnitude-std()
* TimeBodyAccelerometerJerkMagnitude-mean()
* TimeBodyAccelerometerJerkMagnitude-std()
* TimeBodyGyroscopeMagnitude-mean()
* TimeBodyGyroscopeMagnitude-std()
* TimeBodyGyroscopeJerkMagnitude-mean()
* TimeBodyGyroscopeJerkMagnitude-std()
* FrequencyBodyAccelerometer-mean()-X
* FrequencyBodyAccelerometer-mean()-Y
* FrequencyBodyAccelerometer-mean()-Z
* FrequencyBodyAccelerometer-std()-X
* FrequencyBodyAccelerometer-std()-Y
* FrequencyBodyAccelerometer-std()-Z
* FrequencyBodyAccelerometer-meanFreq()-X
* FrequencyBodyAccelerometer-meanFreq()-Y
* FrequencyBodyAccelerometer-meanFreq()-Z
* FrequencyBodyAccelerometerJerk-mean()-X
* FrequencyBodyAccelerometerJerk-mean()-Y
* FrequencyBodyAccelerometerJerk-mean()-Z
* FrequencyBodyAccelerometerJerk-std()-X
* FrequencyBodyAccelerometerJerk-std()-Y
* FrequencyBodyAccelerometerJerk-std()-Z
* FrequencyBodyAccelerometerJerk-meanFreq()-X
* FrequencyBodyAccelerometerJerk-meanFreq()-Y
* FrequencyBodyAccelerometerJerk-meanFreq()-Z
* FrequencyBodyGyroscope-mean()-X
* FrequencyBodyGyroscope-mean()-Y
* FrequencyBodyGyroscope-mean()-Z
* FrequencyBodyGyroscope-std()-X
* FrequencyBodyGyroscope-std()-Y
* FrequencyBodyGyroscope-std()-Z
* FrequencyBodyGyroscope-meanFreq()-X
* FrequencyBodyGyroscope-meanFreq()-Y
* FrequencyBodyGyroscope-meanFreq()-Z
* FrequencyBodyAccelerometerMagnitude-mean()
* FrequencyBodyAccelerometerMagnitude-std()
* FrequencyBodyAccelerometerMagnitude-meanFreq()
* FrequencyBodyAccelerometerJerkMagnitude-mean()
* FrequencyBodyAccelerometerJerkMagnitude-std()
* FrequencyBodyAccelerometerJerkMagnitude-meanFre
* FrequencyBodyGyroscopeMagnitude-mean()
* FrequencyBodyGyroscopeMagnitude-std()
* FrequencyBodyGyroscopeMagnitude-meanFreq()
* FrequencyBodyGyroscopeJerkMagnitude-mean()
* FrequencyBodyGyroscopeJerkMagnitude-std()
* FrequencyBodyGyroscopeJerkMagnitude-meanFreq()
* angle(tBodyAccelerometerMean,gravity)
* angle(tBodyAccelerometerJerkMean),gravityMean)
* angle(tBodyGyroscopeMean,gravityMean)
* angle(tBodyGyroscopeJerkMean,gravityMean)
* angle(X,gravityMean)
* angle(Y,gravityMean)
* angle(Z,gravityMean)



