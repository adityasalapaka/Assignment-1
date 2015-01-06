complete <- function(directory, id = 1:332)  #function definition
{
  filenames<-list.files(directory, full.names = TRUE)  #function to list filenames in a character vector
  dat<-data.frame()  #creates empty data frame
  x<-id  
  y<-vector(mode="numeric",length=0)  #creates an empty numeric vector
  for (i in id)
  {
    dat<-read.csv(filenames[i])
    good<-complete.cases(dat)  #creates logical vector which corresponds to only complete cases
    y<-c(y,sum(good))  #sum() function counts number of TRUE values, thus giving total complete cases for each ID
  }
  results<-data.frame(cbind(x,y))  #creates matrix for result
  colnames(results)<-c("id","nobs")  #column names for matrix
  rownames(results)<-c(1:length(id))  #row names for matrix
  results  #returning matrix
}