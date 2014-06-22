## function to run analysis

# This is main script and requires other scripts to create tidy data set. It performs below tasks.
# * Merges the training and the test sets to create one data set.
# * Extracts only the measurements on the mean and standard deviation for each measurement.
# * Creates a second, independent tidy data set (UCIHAR_average.txt) with the average of each variable for each activity and each subject.

source("features.R")
source("activities.R")
source("subject.R")
source("tidydata.R")

run_analysis = function () {
  
  #crate tidy test data
  datatest = CreateTidyDataSet(datafile = "./UCI HAR Dataset/test/X_test.txt", 
                              featurefile = "./UCI HAR Dataset/features.txt",  
                              accLblfile = "./UCI HAR Dataset/activity_labels.txt", 
                              accfile = "./UCI HAR Dataset/test/y_test.txt", 
                              subjfile = "./UCI HAR Dataset/test/subject_test.txt",
                              dtype = "test")
    
  #crate tidy train data
  datatrain = CreateTidyDataSet(datafile = "./UCI HAR Dataset/train/X_train.txt", 
                               featurefile = "./UCI HAR Dataset/features.txt",  
                               accLblfile = "./UCI HAR Dataset/activity_labels.txt", 
                               accfile = "./UCI HAR Dataset/train/y_train.txt", 
                               subjfile = "./UCI HAR Dataset/train/subject_train.txt",
                               dtype = "train")

  
  #combine training and test datasets
  dataAll = rbind(datatrain, datatest)
  
  #Extracts only the measurements on the mean and standard deviation for each measurement
  use = grep("mean|std", names(dataAll))
  
  # form data frame with subject, activity, type (first 4 columns) and 
  #measurements on the mean and standard deviation for each measurement
  dataAll = cbind(dataAll[ , 1:4], dataAll[, use])
  
  ## create data set for average of all variables per subject per activity
  
  #split data for each activity and subject
  s = split(dataAll, list(dataAll$activity, dataAll$subject), drop = TRUE)
  
  #define new data set for average of all variables per subject per activity
  dataSA = data.frame(NULL)
  
  for (i in (1:length(s))){
    temp = cbind(s[[i]][1 ,1:3], t(colMeans(s[[i]][, 5:83])))
    dataSA = rbind(dataSA, temp)
  }
  
  #Order data by subject and then activity
  dataSA = dataSA[order(dataSA$subject, dataSA$activityId),]
  
  #write it to file in working directory
  write.table(dataSA, "UCIHAR_average.txt", row.names = FALSE)

}
