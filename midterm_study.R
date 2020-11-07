#2주차 퀴즈
score <- c(80,60,70,50,90)
mean(score)
mean_total=mean(score)
mean_total

#3주차 퀴즈
df <- data.frame("제품" = c("사과","딸기","수박"),
                 "가격" = c(1800,1500,3000),
                 "판매량" = c(24,38,13))
df
mean(df$"가격")
mean(df$"판매량")

mpg <- as.data.frame(ggplot2::mpg)
mpg_c <- mpg

library(dplyr)
mpg_c <- rename(mpg_c,city=cty)
mpg_c <- rename(mpg_c,highway=hwy)
mpg_c %>% head()
head(mpg_c)

mpg$total <- (mpg$hwy+mpg$cty)/2
head(mpg)
mean(mpg$total)
summary(mpg$total)
hist(mpg$total)

mpg$test <- ifelse(mpg$total>20,"pass","fail")
head(mpg)
mpg <- mpg %>% mutate(test=ifelse(mpg$total>=20,"pass","fail")) 

table(mpg$test)
library(ggplot2)
qplot(mpg$test)
#중첩조건문
mpg$test <- ifelse(mpg$total<20,"C",ifelse(mpg$total>=30,"A","B"))
table(mpg$test)

mid <- as.data.frame(ggplot2::midwest)
library(dplyr)
mid <- rename(mid,total=poptotal)
mid <- rename(mid,asian=popasian)
mid$ratio <- (mid$asian/mid$total)*100
hist(mid$ratio)
mean(mid$ratio)
mid$size <- ifelse(mid$ratio>mean(mid$ratio),"large","small")
table(mid$size)
qplot(mid$size)

#4주차문제
mpg <- as.data.frame(ggplot2::mpg)
mpg1 <- mpg %>% filter(mpg$displ<=4)
mpg2 <- mpg %>% filter(mpg$displ>=5)
mean(mpg1$hwy)
mean(mpg2$hwy)

library(dplyr)
mpg3 <- mpg %>% filter(mpg$manufacturer=="audi")
mpg4 <- mpg %>% filter(mpg$manufacturer=="toyota")
mean(mpg3$cty)
mean(mpg4$cty)

mpg5 <- mpg %>% filter(mpg$manufacturer%in%c("chevrolet", "ford","honda"))
mean(mpg5$hwy)

mpg_new <- mpg %>% select(class,cty)
mpg_new %>% head()

mpg_data1 <- mpg_new %>% filter(class=="suv")
mpg_data2 <- mpg_new %>% filter(class=="compact") 
mean(mpg_data1$cty)
mean(mpg_data2$cty)

mpg <- as.data.frame(ggplot2::mpg)
mpg %>% filter(manufacturer=="audi") %>% arrange(desc(hwy)) %>% head(5)

mpg_c <- mpg
mpg_c <- mpg_c %>% mutate(total=cty+hwy)
mpg_c <- mpg_c %>% mutate(mean=total/2)
mpg_c
mpg_c %>% arrange(desc(mean)) %>% head(3)

mpg %>% mutate(total=cty+hwy) %>% 
  mutate(mean=total/2) %>% 
  arrange(desc(mean)) %>% 
  head(3)

mpg %>% group_by(manufacturer) %>% 
  filter(class=="suv") %>% 
  mutate(total=(cty+hwy)/2) %>% 
  summarise(mean=mean(total)) %>% 
  arrange(desc(mean)) %>% 
  head(5)

mpg %>% 
  group_by(class) %>% 
  summarise(mean=mean(cty))

mpg %>% 
  group_by(class) %>% 
  summarise(mean=mean(cty)) %>% 
  arrange(desc(mean))

mpg %>% 
  group_by(manufacturer) %>% 
  summarise(mean=mean(hwy)) %>% 
  arrange(desc(mean)) %>% 
  head(3)

mpg %>% 
  group_by(manufacturer) %>% 
  filter(class=="compact") %>% 
  summarise(n=n()) %>% 
  arrange(desc(n))

test1 <- data.frame(id=c(1,2,3,4,5),
                    midterm=c(60,80,70,90,85))
test2 <- data.frame(id=c(1,2,3,4,5),
                    final=c(70,83,65,95,80))
test <- left_join(test1,test2,by="id")
test

fuel <- data.frame(fl=c("c","d","e","p","r"),
                   price_fl=c(2.35,2.38,2.11,2.76,2.22),stringsAsFactors = F)
fuel

mpg <- left_join(mpg,fuel,by="fl")


mpg %>% select(model,fl,price_fl) %>% head(5)

#5추자 문제
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(65,124,131,153,212),"hwy"] <- NA

table(is.na(mpg$drv))
table(is.na(mpg$hwy))
mpg %>% filter(!is.na(mpg$hwy)) %>% 
  group_by(drv) %>% 
  summarise(mean=mean(hwy))

mpg <- as.data.frame(ggplot2::mpg)
mpg[c(10,14,58,93),"drv"] <- "k"
mpg[c(29,43,129,203),"cty"] <- c(3,4,39,42)

table(mpg$drv)
mpg$drv <- ifelse(mpg$drv%in%c("4","r","f"),mpg$drv,NA)

boxplot(mpg$cty)$stats
mpg$cty <- ifelse(mpg$cty>26|mpg$cty<9,NA,mpg$cty)

library(dplyr)
mpg %>% filter(!is.na(mpg$drv)&!is.na(mpg$cty)) %>% 
  group_by(drv) %>% 
  summarise(mean=mean(cty))


#6주차

library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)
ggplot(data=mpg,aes(x=cty,y=hwy))+
  geom_point()

midwest <- as.data.frame(ggplot2::midwest)
ggplot(data=midwest,aes(x=poptotal,y=popasian))+
  geom_point()+
  xlim(0,500000)+
  ylim(0,10000)

mpg <- as.data.frame(ggplot2::mpg)
mpg_c <- mpg %>% filter(class=="suv") %>% 
  group_by(manufacturer) %>% 
  summarise(mean_cty=mean(cty)) %>% 
  arrange(desc(mean_cty)) %>% 
  head(5)

ggplot(data=mpg_c,aes(x=reorder(manufacturer,-mean_cty),y=mean_cty))+
  geom_col()

rm(mpg)
rm(mpg_c)
mpg <- as.data.frame(ggplot2::mpg)
mpg_c <- mpg %>% filter(class=="suv") %>% 
  group_by(manufacturer) %>% 
  summarise(mean_cty=mean(cty)) %>% 
  arrange(desc(mean_cty)) %>% <- 
  head(5)

ggplot(data=mpg_c, aes(x=reorder(manufacturer,-mean_cty),y=mean_cty))+
  geom_col()

ggplot(data=mpg,aes(x=class))+
  geom_bar()

economics <- as.data.frame(ggplot2::economics)
ggplot(data=economics,aes(x=date,y=psavert))+
  geom_line()

mpg_c <- mpg %>% 
  filter(class%in%c("compact","subcompact","suv")) 
ggplot(data=mpg_c,aes(x=class,y=cty))+geom_boxplot()

library(ggplot2)
qplot(data=mpg,x=drv,y=hwy,geom="boxplot",colour=drv)
hist(mpg$hwy)
