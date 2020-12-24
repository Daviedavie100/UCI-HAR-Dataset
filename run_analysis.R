## Loading required packages
library(plyr)

## Download File
getwd()

setwd("C:/Users/dooratharsini/Desktop/Coursera/Course3")
      
if (!file.exists("C:/Users/dooratharsini/Desktop/Coursera/Course3/getdata_projectfiles_UCI HAR Dataset.zip")){
  fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileurl, "getdata_projectfiles_UCI HAR Dataset.zip", method = "curl")
}


if(!file.exists("C:/Users/dooratharsini/Desktop/Coursera/Course3/UCI HAR Dataset")){
  unzip("getdata_projectfiles_UCI HAR Dataset.zip")
}



## Creating all Data frames

setwd("C:/Users/dooratharsini/Desktop/Coursera/Course3/UCI HAR Dataset")

activitylabel <- read.table("activity_labels.txt" , header = F)
dim(activitylabel)

featureslist <- read.table("features.txt" , header = F)
dim(featureslist)




setwd("C:/Users/dooratharsini/Desktop/Coursera/Course3/UCI HAR Dataset/train")

xtrain <- read.table("X_train.txt", header = F)
dim(xtrain)

ytrain <- read.table("y_train.txt", header = F)
dim(ytrain)

subjecttrain <- read.table("subject_train.txt", header = F)
dim(subjecttrain)




setwd("C:/Users/dooratharsini/Desktop/Coursera/Course3/UCI HAR Dataset/test")

xtest <- read.table("X_test.txt", header = F)
dim(xtest)

ytest <- read.table("y_test.txt", header = F)
dim(ytest)

subjecttest <- read.table("subject_test.txt", header = F)
dim(subjecttest)



## Merging Data frames

ucidataset <- rbind(xtrain,xtest)
dim(ucidataset)
head(ucidataset)
activityset <- rbind(ytrain, ytest)
dim(activityset)


subjectset <- rbind(subjecttrain,subjecttest)
dim(subjectset)

##  Uses descriptive activity names to name the activities in the data set

activitysetwithlabel <- join(activityset,activitylabel)
dim(activitysetwithlabel)

mergeddataset <- cbind(ucidataset,activitysetwithlabel$V2,subjectset$V1)
dim(mergeddataset)


##  Extracts only the measurements on the mean and standard deviation for each measurement. 

ExtractedCol <- grep("[mM]ean|std"  ,featureslist$V2)  
length(ExtractedCol)

tidydataset <- mergeddataset[,c(ExtractedCol, 562,563)] 
colnames(tidydataset)


ExtractedColNames <- grep("[mM]ean|std"  ,featureslist$V2, value = TRUE)
colnames(tidydataset) <- c(ExtractedColNames,"Activity","Subject")


##  Appropriately labels the data set with descriptive variable names. 

colnames(tidydataset) <- gsub("Acc","Accelerometer",colnames(tidydataset))
colnames(tidydataset) <- gsub("Gyro","Gyroscope",colnames(tidydataset))
colnames(tidydataset) <- gsub("BodyBody","Body",colnames(tidydataset))
colnames(tidydataset) <- gsub("Mag","Magnitude",colnames(tidydataset))
colnames(tidydataset) <- gsub("^t","Time",colnames(tidydataset))
colnames(tidydataset) <- gsub("^f","Frequency",colnames(tidydataset))



## An independent tidy data set with the average of each variable for each activity and each subject

splittedtidyDataset <- split(tidydataset, list(tidydataset$Activity,tidydataset$Subject))
secondtidydataset <- sapply(splittedtidyDataset, function(x)colMeans(x[, c(1:86)], na.rm = TRUE))
final_tidydataset <- as.data.frame(t(secondtidydataset))
dim(secondtidydataset)

write.table(final_tidydataset, file = "C:/Users/dooratharsini/Desktop/Coursera/Course3/UCI HAR Dataset/final_tidydataset.txt", row.names = FALSE)
