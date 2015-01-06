corr <- function(directory, threshold = 0)  #function defintion
{
  filenames<-list.files(directory, full.names = TRUE)  #function to list filenames in a character vector
  info<-complete(directory)[,"nobs"]  #extracting only number of complete cases using complete() function
  z<-vector(mode="numeric",length=0)  #creating an empty vector of length zero
  for (i in 1:length(info))
  {
    if (info[i]>threshold)  #condition to check if id has more complete cases than threshold
    {
      temp<-read.csv(filenames[i])  #storing file contents 
      good<-complete.cases(temp)  #storing complete cases in a logical vector
      x<-matrix(temp[good,][,"sulfate"])  #matrix to store values of sulfate pollutant
      y<-matrix(temp[good,][,"nitrate"])  #matrix to store values of nitrate pollutant
      z<-c(z,cor(x,y,use="everything"))  #cor() finds correlation between vectors x and y
    }
  }
  z  #return final value
}