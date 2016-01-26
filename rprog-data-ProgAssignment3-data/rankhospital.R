rankhospital <- function(state, outcome, num = "best"){	
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

	## Return hospital name in that state with the given rank
	interest <- df[df$state==state&!is.na(df$outcome),]

	# assign index to best and worst case
	if (class(num) == "character"){
		if(num == "worst"){
			num = nrow(interest)
			#print(num)
		}
		else if (num == "best"){
			num = 1
		}
	}

#sort by state then outcome then hospital name by order()
	orderedindex <- order(interest$state,interest$outcome,interest$hospital)
	# extract hospital name
	return(interest[orderedindex[num],]$hospital)
	## 30-day death rate
}


#testcase
print(rankhospital("TX", "heart failure", 4))
print(rankhospital("MD", "heart attack", "worst"))
print(rankhospital("MN", "heart attack", 5000))


