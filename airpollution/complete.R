complete <- function(directory, id = 1:332){
  # rtype: data frame 
  # 1st col: name of file
  # 2nd col: # of completed cases
  setwd(directory)
  #initi
  df <- data.frame()
  filelist <- list.files(pattern = "*.csv")
  for (i in id){
    current <- read.csv(filelist[i])
    completed <- sum(!is.na(current$nitrate&current$sulfate))
    newrow <- c(i,completed)
    df <- rbind(df,newrow)
  }
  colnames(df) <- c('id','nobs')
  return(df)
}