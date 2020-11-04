a<-c(1,2,3)
a
mean(a)
max(a)
str1<-c("hello!", "my name is", "hyejin")
str1
paste(str1, collapse=",")
paste(str1, collapse=" ")
str1_paste<-paste(str1, collapse=" ")
str1_paste
install.packages("ggplot2")
library(ggplot2)
x<-c("a","a","b","c")
qplot(x)
qplot(data=mpg, x=hwy)
qplot(data=mpg, x=cty)
qplot(data=mpg, x=drv, y=hwy)
qplot(data=mpg, x=drv, y=hwy, geom="line")
qplot(data=mpg, x=drv, y=hwy, geom="boxplot")
qplot(data=mpg, x=drv, y=hwy, geom="boxplot", colour=drv)
?qplot

#Q1
grade <- c(80, 60, 70, 50, 90)
grade

#Q2
mean(grade)

#Q3
grade_mean <- mean(grade)
grade_mean

a<-c(1:5)
a
b<-seq(1,5)
b

