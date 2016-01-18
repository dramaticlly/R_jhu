library(datasets)
data(iris)

# filter condition get rows of interest
vir <- iris[iris$Species == 'virginica',]
m1 <- mean(vir$Sepal.Length)
print(m1)

#what R code returns a vector of the means of the variables 'Sepal.Length', 'Sepal.Width', 'Petal.Length', and 'Petal.Width'?
m2 <- apply(iris[,1:4],2,mean) #2 means col
	colMeans(iris[,1:4])
print(m2)

data(mtcars)
#How can one calculate the average miles per gallon (mpg) by number of cylinders in the car (cyl)? Select all that apply.
m3 <- tapply(mtcars$mpg,mtcars$cyl,mean)
#other alternative
	with(mtcars, tapply(mpg, cyl, mean))
	sapply(split(mtcars$mpg,mtcars$cyl),mean)
print(m3)

#what is the absolute difference between the average horsepower of 
# 4-cylinder cars and the average horsepower of 8-cylinder cars?
res <- tapply(mtcars$hp,mtcars$cyl,mean)
absdif <- round(res[3] - res[1])
print(absdif)