corr <- function(directory, threshold = 0){
  # care only about location where threshold > completed
  # correlation between sulfate and nitrate
  # rtype: vector of corr for monitors that meet threshold, 
  #        otherwise return length 0 vector
  setwd(directory)
  d <- complete(directory)
  validrow <- which(d$nobs > threshold)
  size <- length(validrow)
  stopifnot(class(size)=="integer")
  cared <- d[validrow,]     #list of record
  fileindex <- cared$id
  # init vector 
  vector <- numeric(size)
  count <- 1
  # read file
  filelist <- list.files(pattern = "*.csv")
  for (i in fileindex){
    myfile <- read.csv(filelist[i])  #data.frame
    stopifnot(class(myfile)=="data.frame") #put proceed condition inside bracket
    cr <- cor(myfile$sulfate,myfile$nitrate,use = 'complete.obs')
    vector[count] <- cr
    count <- count + 1
  }
  return(vector)
} 