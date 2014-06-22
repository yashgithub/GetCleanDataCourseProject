## function to read activities
# It reads activity labels and activities from respective data file, joins them together using activity id 
# and creates activities data frame. It uses descriptive activity names to name the activities in the data set. 
# It takes activity labels and activities data file as input argument.

ReadActivities = function(accLblfile, accfile){
  
  # load activity lables
  acclabels = read.table(accLblfile)
  
  # add column names to activity 
  names(acclabels) = c("activityId", "activity")
  
  #load activities
  activities = read.table(accfile)
  
  #add column name as activity Id
  names(activities) = "activityId"
  
  # join activity labels and activities
  activities = merge(acclabels, activities, by.x = "activityId", by.y = "activityId")
  
  activities
} 
