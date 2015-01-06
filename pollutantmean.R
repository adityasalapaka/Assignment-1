pollutantmean <- function(directory, pollutant, id = 1:332)  #function definition
{
  filenames<-list.files(directory, full.names = TRUE)  #function to list filenames in a character vector
  dat<-data.frame()  #creates empty data frame
  for (i in id)
  {
    dat<-rbind(dat,read.csv(filenames[i]))  #data frame is filled up with file contents
  }
  dat_subset<-dat[ ,pollutant]  #subset of data frame based on pollutant given in function call
  mean(dat_subset, na.rm=TRUE)  #final calculation of artithmetic mean and return
}