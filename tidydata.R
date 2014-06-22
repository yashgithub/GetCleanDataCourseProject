## function to create tidy dataset
# It loads features, activities, subjects, measurement data by calling respective functions. 
# It combines activities, subject, type (test or train taken as input argument) and measurement data to create tidy data set. 
# It labels the data set with descriptive variable names using features data.

CreateTidyDataSet = function(datafile, featurefile,  accLblfile, accfile, subjfile, dtype) {
  
  #load measurement data
  mdata = read.table(datafile)
  
  #add column names of mesurement data to features
  names(mdata) = ReadFeatures(featurefile)$Feature
  
  #create data frame with 1 column name Type with value train 
  #and rows equal to rows in mdata to identify train data
  type = data.frame(rep(dtype, nrow(mdata)))
  
  #set column name to Type
  names(type) = "Type"
  
  #load activities
  activities = ReadActivities(accLblfile, accfile)
  
  #load subjects
  subject = ReadSubjects(subjfile)
  
  #merge the subject, activities, type and measurement data
  data = cbind(subject, activities, type, mdata)
  
  data
  
}
