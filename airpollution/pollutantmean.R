
pollutantmean <- function (directory, pollutant, id = 1:332){
  #init
  mysum <- 0
  mylen <- 0
  # cd to target dir
  setwd(directory)
  # scan file, add to sum, add to #of non-NA record
  filelist <- list.files(pattern = "*.csv")
  #for (i in id[1]:id[length(id)]){
  for (i in id){
    current <- read.csv(filelist[i])
    mysum = mysum + sum(current[[pollutant]],na.rm = T)
    mylen = mylen + sum(!is.na(current[[pollutant]]))
  }
  # get mean
  mysum/mylen
}

path <- "/Users/stevezhang/git/R_jhu/airpollution/"