#5주차 수업
exam <- read.csv("csv_exam.csv")
exam[c(3,8,15), "math"] <- NA
exam

library(dplyr)
exam %>% summarise(mean_math=mean(math))
exam %>% summarise(mean_math=mean(math,na.rm=T))

#퀴즈
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(65,124,131,153,212),"hwy"] <- NA
#Q1
table(is.na(mpg$drv))
table(is.na(mpg$hwy))
#Q2
mpg %>%  filter(!is.na(mpg$hwy)) %>%
  group_by(drv) %>%
  summarise(mean_hwy=mean(hwy)) 
#-------------------------------
outlier <- data.frame(sex=c(1,2,1,3,2,1),
                      score=c(5,4,3,4,2,6))
outlier
table(outlier$sex)
table(outlier$score)
outlier$sex <- ifelse(outlier$sex==3,NA, outlier$sex) 
outlier
outlier$score <- ifelse(outlier$score>5,NA,outlier$score)
outlier
outlier %>% 
  filter(!is.na(sex)&!is.na(score)) %>% 
  group_by(sex) %>% 
  summarise(mean_score=mean(score))

mpg <- as.data.frame(ggplot2::mpg)
boxplot(mpg$hwy)
boxplot(mpg$hwy)$stats

#quiz
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(10,14,58,93),"drv"] <- "k"
mpg[c(29,43,129,203),"cty"] <- c(3,4,39,42)
mpg

#q1
table(mpg$drv)
mpg$drv  <-  ifelse(mpg$drv %in% c("4","f","r"), mpg$drv,NA)

#q2
boxplot(mpg$cty)
boxplot(mpg$cty)$stats

mpg$cty <- ifelse(mpg$cty<9|mpg$cty>26,NA,mpg$cty)
table(is.na(mpg$cty))
boxplot(mpg$cty)

#q3
mpg %>% filter(!is.na(mpg$cty)&!is.na(mpg$drv)) %>% 
  group_by(drv) %>% 
  summarise(mean_cty=mean(cty))
