rm(list = ls())

library(MASS)
library(knitr)
setwd("C:/Users/Ichchhayakant/Desktop/Ashutosh")
library(xlsx)
library(stats)
data<-read.xlsx("1-50 1.xlsx",1,header = T)

data<- data[,c(1:13)]
library(ggplot2)
library(plotly)
head(data)
str(data)
data1<- as.data.frame(t(data))
data1<-data1[-1,]
##timeSeries<- ts(data)
require(reshape2)
molten<- melt(data, id.vars = "SPI", measure.vars = c("NA.", "NA..1"))
plot(molten)


ggplot(data=data1, aes(x=SPI,y=NA., group=1))+geom_line(col="red")+geom_point()
##plot.ts(timeSeries[,])
##plot(data$SPI,data$NA.,type = "l")
##lines(data$SPI,data$NA.)

#orddata<- data1[order(data1$V1),]
ggplot(data=data1, aes(x=V1,y=V2, group=1))+geom_line(col="red", stat ="identity", position = "identity")+geom_point()
data1$V1=c(1,2,3,4,5,6,7,8,9,10,11,12)
ggplot(data=data1, aes(x=V1,y=V2, group=1))+geom_line(col="red",stat ="identity")+geom_point()
ggplot(data=data1, aes(x=V1,y=V3, group=1))+geom_line(col="green",stat ="identity")+geom_point()
ggplot(data=data1, aes(x=V1,y=V4, group=1))+geom_line(col="blue",stat ="identity")+geom_point()
#multiplot(p1,p2,p3, cols=2)
#plot(p1)

barplot(t(as.matrix(data[-1])),
        names.arg=as.character(data$SPI, beside=T)) 


kable(head(data))
head(data)
tail(data)
str(data)
class(data)

data$NA.<- as.numeric(data$NA.)
data$NA..1<- as.numeric(data$NA..1)
data$NA..2<- as.numeric(data$NA..2)
data$NA..3<- as.numeric(data$NA..3)
data$NA..4<- as.numeric(data$NA..4)
data$NA..5<- as.numeric(data$NA..5)
data$NA..6<- as.numeric(data$NA..6)
data$NA..7<- as.numeric(data$NA..7)
data$NA..8<- as.numeric(data$NA..8)
data$NA..9<- as.numeric(data$NA..9)
data$NA..10<- as.numeric(data$NA..10)
data$NA..11<- as.numeric(data$NA..11)
str(data)
#data<-as.data.frame(scale(data))


SPI<- data[,2]
a <- ts(SPI, start = 1901, end = 2015, frequency = 1)
a
plot.ts(a)
library(forecast)

ha=HoltWinters(a,beta=F,gamma=F)
ha

ha$fitted

ha$SSE
fha<-forecast:::forecast.HoltWinters(ha,h=1)
fha
forecast:::plot.forecast(fha)


View(fha$fitted)
