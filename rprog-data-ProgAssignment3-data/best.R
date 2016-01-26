sorted <- sort(interest$outcome,na.last = TRUE)#P2
# best <- function(state,outcome)
# return char vector with name of hospital that has the lowest 30-dat morality for specified outcome in state
# hospital name provided in outcome$Hospital.Name 
# outcome = "heart attack", "heart failure", "pneumonia"
# exclude hospital that do not have data on outcome
# HANDLING TIES: alphabetical order

best <- function(state, outcome){
	## Read outcome data
	data <- read.csv("outcome-of-care-measures.csv",na.strings="Not Available",stringsAsFactors=FALSE)	

	## Check that state and outcome are valid
	allstate <- unique(data$State)
	alloutcome <- c("heart attack","heart failure","pneumonia")
	validstate <- is.element(state,allstate)
	validoutcome <- is.element(outcome,alloutcome)
	if (!validstate){
		stop("invalid state")
	}
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

	# apply the state and outcome != na condition 
	interest <- df[df$state==mystate&!is.na(df$outcome),]
	
	## rate
	sorted <- sort(interest$outcome,na.last = TRUE)				   # sort by best morality rate
	#print(sorted[1])
	## Return hospital name in that state with lowest 30-day death
	grpbest <- interest[interest$outcome == sorted[1],]$hospital   # sort by alphabetical order
	return(sort(grpbest))
}
