# Source: https://www.youtube.com/watch?v=dJclNIN-TPo


data<-read.csv("CTG.csv")
str(data)
data$NSP<-as.factor(data$NSP)
table(data$NSP)


#Data Partition

s<-sample(2, nrow(data),replace=TRUE,c(0.7,0.3))
data_train<-data[s==1,]
data_test<-data[s==2,]

#Random Forest
library(randomForest)
set.seed(222)
rf<-randomForest(NSP~.,data=data_train)
print(rf)



#Prediction

library(caret)
library(e1071)
ptrain<-predict(rf,data_train)
confusionMatrix(ptrain,data_train$NSP)
ptest<-predict(rf,data_test)
confusionMatrix(ptest,data_test$NSP)


#Error Rate

plot(rf)


#Variable Importance
varImpPlot(rf)
importance(rf)
varUsed(rf)
