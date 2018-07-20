#RevHelper model

#loading the library
library(randomForest)
library(caTools)
library(e1071)
library(caret)

#capture the data
traindata=read.table(file="path/to/modeldata-training-and-testing.txt", header=TRUE)
testdata=read.table(file="path/to/model-validation-data.txt", header=TRUE)


#replacing the NA values
traindata=na.omit(traindata)
testdata=na.omit(testdata)

#initializing the performance
sumAcc=0
sumPosPrec=0
sumPosRec=0
sumNegPrec=0
sumNegRec=0
sumImp=0

#now test performance with 10 different models
for(i in 200:209){
  
  #setting seeds for different randomization
  set.seed(i)
  
  #shuffling the data
  sampleddata=cleandata[sample(nrow(traindata), nrow(traindata)), ] 
  
  summary(sampleddata)
  
  
  #summary of train and test data
  #summary(sampleddata)
  #summary(testdata)
  
  #developing RevHelper model -RF fir
  fit <- randomForest(as.factor(className) ~
                        .,  
                      data=sampleddata, 
                      importance=TRUE, 
                      ntree=2000)
  
  
  #accumulating the importance
  imp=importance(fit)
  sumImp =sumImp + imp

  
  #prediction model
  Prediction <- predict(fit, testdata)
  
  
  #calculating the performance
  cm=confusionMatrix(data=Prediction,
                     reference=testdata$class,
                     positive='u')
  

  sumAcc = sumAcc+  cm$overall['Accuracy']
  sumPosPrec=sumPosPrec+ cm$byClass['Pos Pred Value']
  sumPosRec=sumPosRec + cm$byClass['Sensitivity']
  sumNegPrec=sumNegPrec + cm$byClass['Neg Pred Value']
  sumNegRec=sumNegRec + cm$byClass['Specificity']
  
  #showing model performance for each run
  print(c(cm$byClass['Pos Pred Value'],cm$byClass['Sensitivity'],cm$byClass['Neg Pred Value'],cm$byClass['Specificity'],cm$overall['Accuracy']) ) 
  
}

#showing the average performance
print(sumPosPrec/10)
print(sumPosRec/10)
print(sumNegPrec/10)
print(sumNegRec/10)
print(sumAcc/10)
myImp=sumImp/10
print(myImp)




