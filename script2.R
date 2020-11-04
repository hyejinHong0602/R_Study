english <- c(90,80,60,70)
math <- c(50,60,100,20)
class <- c(1,2,3,4)
df_midterm <- data.frame(english, math, class)
df_midterm
제품 <- c("사과", "딸기", "수박")
가격 <- c(1800,1500,3000)
판매량 <- c(24,38,13)
제품 <- c(apple,strawberry,watermelon)
df_price <- data.frame(제품, 가격, 판매량)
df_price
mean(df_price$"판매량")
mean(df_price$"가격")
install.packages("readxl")
library(readxl)
df_exam <- read_excel("excel_exam.xlsx")
df_exam
df_exam_novar <- read_excel("excel_exam_novar.xlsx",col_names=F)
df_exam_novar
df_csv_exam <- read.csv("csv_exam.csv")
df_csv_exam
df_price
write.csv(df_price, file="df_price.csv")
save(df_price, file="df_price.rda")
df_price
rm(df_price)
load("df_price.rda")
View(df_price)
dim(df_price)
str(df_price)
summary(df_price)
mpg<-as.data.frame(ggplot2::mpg)
head(mpg)
install.packages("dplyr")
library(dplyr)
df_raw <- data.frame(var1=c(1,2,1),
                     var2=c(2,3,2))
df_raw
df_new <- df_raw
df_new
df_new <- rename(df_new, v2=var2)
#quiz ppt 25page

rm(mpg)
mpg
mpg<-as.data.frame(ggplot2::mpg)
copy_mpg <- mpg
copy_mpg <- rename(mpg,city=cty)
copy_mpg <- rename(mpg,highway=hwy)
copy_mpg
View(copy_mpg)
head(copy_mpg)

#파생변수만들기
df <- data.frame(var1=c(4,3,8),
                 var2=c(2,6,1))
df$var_sum <- df$var1+df$var2
df
df$var_mean <- (df$var1+df$var2)/2
df
mpg$total <- (mpg$cty+mpg$hwy)/2
mpg
head(mpg)
summary(mpg$total)
hist(mpg$total)
ifelse(mpg$total>=20,"pass","fail")
mpg$test <- ifelse(mpg$total>=20,"pass","fail")
mpg
head(mpg)
table(mpg$test)
library(ggplot2)      
qplot(mpg$test)
mpg$grade <- ifelse(mpg$total>=30,"A",
                    ifelse(mpg$total>=20,"B","C"))
head(mpg,20)
table(mpg$grade)
qplot(mpg$grade)

#quiz ppt 37page
midwest<-as.data.frame(ggplot2::midwest)
new_midwest<-midwest  
new_midwest <- rename(new_midwest,total=poptotal)
new_midwest <- rename(new_midwest,asian=popasian)
head(new_midwest)
