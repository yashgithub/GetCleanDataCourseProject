# Program to create tidy dataset from Human Activity Recognition Using Smartphones Dataset provided by coursera for project work of course Getting and Cleaning data.

## R scripts.

### run_analysis.R - 
This is main script and requires other scripts to create tidy data set. It performs below tasks.
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Creates a second, independent tidy data set (UCIHAR_average.txt) with the average of each variable for each activity and each subject.
	
### features.R - 
Function ReadFeatures reads features file and create data frame for features. It takes features data file as input argument.
 
### activities.R - 
It reads activity labels and activities from respective data file, joins them together using activity id and creates activities data frame. It uses descriptive activity names to name the activities in the data set. It takes activity labels and activities data file as input argument. 
 
### subject.R - 
It reads subject data file and creates data frame for subjects. It takes subject data file as input argument.

### tidydata.R - 
It loads features, activities, subjects, measurement data by calling respective functions. It combines activities, subject, type (test or train taken as input argument) and measurement data to create tidy data set. It labels the data set with descriptive variable names using features data.
  
