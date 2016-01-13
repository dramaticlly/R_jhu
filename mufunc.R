myfunction <- function(x){
	y <- rnorm(100)
	mean(y)
}

second <- function(x){
	x + rnorm(length(x))
}

seqNum <- vector("numeric",length = 10) #default to 0
mylst <- list(1,"a",TRUE,1+4i)
mymatrix <- matrix(1:6, nrow = 2, ncol = 3) #construct col wise
fa <- factor(c("yes","yes","no","yes","no"),levels = c("yes","no"))

#construct matrix from existing sequence
m <- 1:10
mc1 <- 1:5
mc2 <- 6:10
cbind(mc1,mc2) #OR rbind
dim(m) <- c(5,2) #x*y = length(m)
