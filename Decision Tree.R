
l<-iris

set.seed(1234)
pd<-sample(2,nrow(l),replace= TRUE, prob=c(0.7,0.3))
train<-l[pd==1,]
test<-l[pd==2,]
library(rpart)
tree1<-rpart(Species~.,train,method = "class")
library(rpart.plot)
rpart.plot(tree1,extra = 4)
pred<-predict(tree1,newdata = test,type="class")
table(pred,test$Species)
length(pred)
length(test$Species)
nrow(test)
nrow(pred)
n
set.seed(678)

data_url <- c("https://archive.ics.uci.edu/ml/machine-learning-databases/car/car.data")
download.file(url = data_url, destfile = "car.data")

car_df <- read.csv("car.data", sep = ',', header = FALSE)
set.seed(3033)
s<-sample(2,nrow(car_df),replace=TRUE,prob=c(0.7,0.3))
training <- car_df[s==1,]
testing <- car_df[s==2,]
library(rpart)
dtree_fit <- rpart(V7 ~., data = training, method = "class")
test_pred<-predict(dtree_fit,newdata = testing,method="class")
confusionMatrix(test_pred,testing$V7)

table(factor(pred, levels=min(test):max(test)), factor(test, levels=min(test):max(test)))




