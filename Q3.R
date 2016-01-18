library(datasets)
data(iris)

vir <- iris[irisi$Species == 'virginica']
mean(vir$Species.Length)

#what R code returns a vector of the means of the variables 'Sepal.Length', 'Sepal.Width', 'Petal.Length', and 'Petal.Width'?
apply(iris[,1:4],2,mean) #2 means col
colMeans(iris[,1:4])

data(mtcars)
#How can one calculate the average miles per gallon (mpg) by number of cylinders in the car (cyl)? Select all that apply.
tapply(mtcars$mpg,mtcars$cyl,mean)
#other alternative
	with(mtcars, tapply(mpg, cyl, mean))
	sapply(split(mtcars$mpg,mtcars$cyl),mean)

#what is the absolute difference between the average horsepower of 
# 4-cylinder cars and the average horsepower of 8-cylinder cars?
