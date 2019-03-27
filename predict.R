library(MASS)
library(neuralnet)

setwd("C:/Users/Ichchhayakant/Desktop/Ashutosh")
library(xlsx)

data<-read.xlsx(file.choose(),1)
data<- data[,c(2:13)]
str(data)
newdata<- data
#newdata<- newdata[sample(nrow(newdata)),]
newdata$NA.<- as.numeric(newdata$NA.)
newdata$NA..1<- as.numeric(newdata$NA..1)
newdata$NA..2<- as.numeric(newdata$NA..2)
newdata$NA..3<- as.numeric(newdata$NA..3)
newdata$NA..4<- as.numeric(newdata$NA..4)
newdata$NA..5<- as.numeric(newdata$NA..5)
newdata$NA..6<- as.numeric(newdata$NA..6)
newdata$NA..7<- as.numeric(newdata$NA..7)
newdata$NA..8<- as.numeric(newdata$NA..8)
newdata$NA..9<- as.numeric(newdata$NA..9)
newdata$NA..10<- as.numeric(newdata$NA..10)
newdata$NA..11<- as.numeric(newdata$NA..11)
str(newdata)

set.seed(1000)
train<- sample(nrow(newdata)*0.7,replace = F)
traindata <- newdata[train,]
testdata <- newdata[-train,]


dim(newdata)

head(newdata)

dim(traindata)

allVars<- colnames(newdata)
predictorVars <- allVars[!allVars%in%"NA."]
predictorVars <- paste(predictorVars,collapse = "+")

str(newdata)

form= as.formula(paste("NA.~",predictorVars,collapse = "+"))

neuralModel <- neuralnet(formula = form, hidden=2, linear.output=T, data = traindata)

neuralModel
## Result options
names(neuralModel)

plot(neuralModel)

neuralModel$result.matrix


out <- cbind(neuralModel$covariate,neuralModel$net.result[[1]])
head(out)
dimnames(out) <- list(NULL, 
                      c("Prev.Close", "Open.Price","High.Price",
                        "Low.Price","Total.Traded.Quantity","nn-output"))

head(neuralModel$generalized.weights[[1]])

testdata<- testdata[1:nrow(testdata)-1,]
str(testdata)

predictions <- compute(neuralModel,testdata[,-1])
str(predictions)
predictions$net.result

## predicting and unscalling
predictions <- predictions$net.result

actualValues <- testdata$NA.


MSE <- sum((predictions-actualValues)^2)/nrow(testdata)
MSE


plot(testdata$NA., predictions, col='blue', main = 'Real vs Predicted',pch=1, cex=0.9, type="p", xlab = "Actual", ylab= "Predicted")


#### Predicting for today
today <-c(0.875372856,1.96013425,0.875372856,1.160502964,
          -2.133707486,0.486382959,-0.805585549,0.921451318,
          0.312688892,-0.425360864,1.422025763)


new.output<- compute(neuralModel,covariate = matrix(c(0.875372856,1.96013425,0.875372856,1.160502964,
                                                      -2.133707486,0.486382959,-0.805585549,0.921451318,
                                                      0.312688892,-0.425360864,1.422025763)
                                                    ,
                                                    byrow = TRUE, ncol=11 ))


new.output$net.result





