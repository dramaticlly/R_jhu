# create set/get function
makeVector <- function(x = numeric()){
	m <- NULL

	set <- function(y){
		x <<- y
		m <<- NULL
	}

	get <- function(){
		x
	}

	setmean <- function(mean){
		m <<- mean
	}

	getmean <- function(){
		m
	}

	list(set    = set,
		get     = get,
		setmean = setmean,
		getmean = getmean)
}

# create cache function
cachemean <- function(x, ...){
	m <- x$getmean()
	# validate mean 
	if (!is.null(m)){
		message("getting cached data")
		return(m)
	}
	# if not set/NULL
	data <- x$get()
	m <- mean(data,...)
	x$setmean(m)
	return(m)
}


# testcase
input <- c(1,2,3)
message("should see cached output");
v <- makeVector(input)
cachemean(v)
cachemean(v)