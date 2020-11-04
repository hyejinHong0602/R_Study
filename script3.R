#study 201005
#2주차 연습문제
score<-c(80, 60, 70, 50, 90)
mean_score<-mean(score)
mean_score

#3주차 연습문제
#1
df<-data.frame(제품=c("사과", "딸기", "수박"),
                 가격=c(1800,1500,3000),
                 판매량=c(24,38,13))
df
df_mean1<-mean(df$"가격")
df_mean1
df_mean2<-mean(df$"판매량")
df_mean2

install.packages("ggplot2")
library(ggplot2)
df<-as.data.frame(ggplot2::mpg)
df
df_copy<-df
install.packages("dplyr")
library(dplyr)
df_copy<-rename(df_copy, city=cty)
df_copy
df_copy<-rename(df_copy, highway=hwy)
head(df_copy)


midwest<-as.data.frame(ggplot2::midwest)
midwest_copy<-midwest
midwest_copy<-rename(midwest_copy,total=poptotal)
midwest_copy<-rename(midwest_copy,asian=popasian)
head(midwest_copy)
midwest_copy$percentage<-(midwest_copy$asian/midwest_copy$total)*100
midwest_copy
hist(midwest_copy$percentage)
mean_percentage<-mean(midwest_copy$percentage)
midwest_copy$largeorsmall<-ifelse(midwest_copy$percentage>mean_percentage,"large", "small")
library(ggplot2)
qplot(midwest_copy$largeorsmall)
table(midwest_copy$largeorsmall)

#4주차 연습문제
mpg <- as.data.frame(ggplot2::mpg)
mpg_c <- mpg
library(dplyr)
data_1 <- mpg_c %>% filter(displ<=4)
data_2 <- mpg_c %>% filter(displ>=5)
mean(data_1$hwy)
mean(data_2$hwy)

data_3 <- mpg_c %>% filter(manufacturer=="audi")
data_4 <- mpg_c %>% filter(manufacturer=="toyota")
mean(data_3$cty)
mean(data_4$cty)

data_5 <- mpg_c %>% filter(manufacturer=="chevrolet"|manufacturer=="ford"|manufacturer=="honda")
mean(data_5$hwy)

library(dplyr)
mpg <- as.data.frame(ggplot2::mpg)
mpg_new <- mpg %>% select(class, cty)
mpg_suv <- mpg_new %>% filter(mpg_new$class=="suv")
mpg_compact <- mpg_new %>% filter( mpg_new$class=="compact")
mean(mpg_suv$cty)
mean(mpg_compact$cty)

mpg_audi <- mpg %>% filter(mpg$manufacturer=="audi")
mpg_audi %>% arrange(desc(hwy)) %>% head(5)


mpg <- as.data.frame(ggplot2::mpg)
mpg_copy <- mpg
mpg_copy <- mpg_copy %>% mutate("합산연비변수"=hwy+cty)
mpg_copy <- mpg_copy %>% mutate("평균연비변수"=합산연비변수/2)
mpg_copy
mpg_copy %>% arrange(desc("평균연비변수")) %>% head(3)

mpg %>% 
  mutate("합산연비변수"=hwy+cty) %>% 
  mutate("평균연비변수"=합산연비변수/2) %>% 
  arrange(desc("평균연비변수")) %>% head(3)

mpg <- as.data.frame(ggplot2::mpg)
mpg_group <- mpg %>% group_by(class) %>% summarise(mean_cty=mean(cty))%>% arrange(desc(mean_cty))

mpg %>% group_by(manufacturer) %>% summarise(mean_hwy=mean(hwy)) %>% arrange(desc(mean_hwy)) %>% head(3)
mpg_group
mpg_group <- mpg_group %>% arrange(desc(mean_cty))
mpg_group %>% head(3)                             

mpg %>% filter(class=="compact") %>% group_by(manufacturer) %>% summarise(compact_num=n()) %>% arrange(desc(compact_num))
mpg

mpg <- as.data.frame(ggplot2::mpg)
fuel <- data.frame(fl=c("c","d","e","p","r"),
                   price_fl=c(2.35,2.38,2.11,2.76,2.22),
                   stringsAsFactors = F)
fuel
mpg <-left_join(mpg, fuel, by="fl") %>% head
mpg %>% select(model,fl,price_fl)

