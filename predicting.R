setwd("C:/Users/Ichchhayakant/Desktop/Ashutosh")
library(xlsx)
data <- read.csv("data.csv", header = F)
datadata <- data[-c(1,2),2:13]
data<-data[-c(1,2),]

colnames(data)<-(c(" ","Jan","Feb","Mar","Apr","May","Jun","Jul","Aug",
                    "Sep","Oct","Nov","Dec"))

rownames(data)<-c(1901:2015)
data<-data[,-1]
data

library(xts)
data1 <- as.ts(data)
str(data1)
class(data1)
ts_data <- data[1:10,]
ts.plot(data)
ts.plot(ts_data)
library(zoo)



library(xts)
data1 <- as.ts(data)
data1
colnames(data1)
class(data1)
data1<- data1[1:9,]
plot(data1)
time(data1) 
data1


colnames(AirPassengers)
AirPassengers
str(AirPassengers)
plot(AirPassengers)
class(AirPassengers)
