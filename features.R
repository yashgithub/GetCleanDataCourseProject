## function to read features
#Function ReadFeatures reads features file and create data frame for features. It takes features data file as input argument.

ReadFeatures = function (featurefile){
  
  #load features
  features = read.table(featurefile)
  
  # add column names to activity 
  names(features) = c("featureNo", "Feature")
  
  features
}
