## function to read subjects
#It reads subject data file and creates data frame for subjects. 
#It takes subject data file as input argument.

ReadSubjects =  function(subjfile){
  
  #load subjects
  subject = read.table(subjfile)
  
  #add column name for subject to "subject"
  names(subject) = "subject"
  
  subject
}
