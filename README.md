# Peer-graded Assignment: Getting and Cleaning Data Course 

* Dataset:Human Activity Recognition Using Smartphones Dataset - Version 1.0

  The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities     (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its      embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The         experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of    the volunteers was selected for generating the training data and 30% the test data. 
* 
* It has the instructions on how to run analysis on Human Activity recognition dataset.
* 
*
run_analysis.R performs the data preparation and then followed by the steps required as described in the course project’s instructions:

  * Downloaded the Dataset zip file.Unzipped the Dataset
  * Loaded datasets from text files.
    *	features_info.txt
    * features.txt
    *	activity_labels.txt
    *	train/X_train.txt
    *	train/y_train.txt
    *	test/X_test.txt
    * test/y_test.txt
    *	train/subject_train.txt
    * train/Inertial Signals/total_acc_x_train.txt
    * train/Inertial Signals/body_acc_x_train.txt
    *	train/Inertial Signals/body_gyro_x_train.txt
* Merged the training and the test sets to create one data set.
* Binded Activity name and subject code to merged data set
* Used descriptive activity names to name the activities in the data set
* Extracted only the measurements on the mean and standard deviation for each measurement.
* Appropriately labeled the data set with descriptive variable names.
* Created a second, independent tidy data set with the average of each variable for each activity and each subject.
*	Final_tidydataset.txt is the exported final data after going through all the sequences described above.

# Files
CodeBook.md a code book that describes the variables, the data, and any transformations or work that I performed to get and clean up the data