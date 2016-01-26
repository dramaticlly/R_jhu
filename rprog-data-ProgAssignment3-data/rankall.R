#rtype: a 2-column data frame (hospital,state)
#		containing the hospital in each state that has the ranking specified in num.
#       containing the names of the hospitals that are the best in their respective states with 30-day outcome death rate
#		The function should return a value for every state (some may be NA)
rankall <- function(outcome, num = "best"){	
	## Read outcome data
	data <- read.csv("outcome-of-care-measures.csv",na.strings="Not Available",stringsAsFactors=FALSE)	
	## Check that state and outcome are valid
	allstate <- unique(data$State)
	alloutcome <- c("heart attack","heart failure","pneumonia")

	validoutcome <- is.element(outcome,alloutcome)
	if (!validoutcome){
		stop("invalid outcome")
	}

	# subsetting the column base on outcome input
	outcomes <- c("heart attack"=11, "heart failure"=17, "pneumonia"=23) 
	# we only need 3 col, 2 for Hospital name, 7 for state and interested outcome, rename afterwards
	colindex <- outcomes[outcome]
stopifnot(class(colindex)=="numeric")
	df <- data[,c(2,7,colindex)]
	names(df)<-c("hospital","state","outcome")

	## For each state, find the hospital of the given rank
	interest <- df[!is.na(df$outcome),]
	sorted <- interest[order(interest$outcome,interest$hospital),]
	statewise <- split(sorted,sorted$state)

	# class(statewise['AK'])         [1] "list"
	# class(statewise[[1]])          [1] "data.frame"

	#content <- statewise[[1]], content of 'AK'
	#hosname <- content[[1]], char vector of hospital name
	#rankedhos <- content[[1]][1], the best hospital in 'AK'
	#				  statenum, num


	#lapplied <- lapply(statewise,"[",1)
	#hos <- unlist(lapplied)  #2720
	#sta <- names(lapplied)
	#ndf <- data.frame(hospital=hos,state=sta,row.names = sta)

	## Return a data frame with the hospital names and the
	## (abbreviated) state name
}


#test case 
print(head(rankall("heart attack", 20), 10))
print(tail(rankall("pneumonia", "worst"), 3))
print(tail(rankall("heart failure"), 10))