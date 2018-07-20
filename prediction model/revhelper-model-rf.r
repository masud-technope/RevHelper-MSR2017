#RevHelper Model

#loading the library
library(randomForest)
library(caTools)
library(e1071)
library(caret)

#load the model data
data=read.table(file="path/to/modeldata-training-and-testing.txt", header=TRUE)
#show a summary if needed
#summary(data)

#replacing the NA values
cleandata=na.omit(data)
summary(cleandata)


#initialize the performance measures
sumAcc=0
sumPosPrec=0
sumPosRec=0
sumNegPrec=0
sumNegRec=0
sumImp=0


for(i in 200:209){

#setting seed points to ensure different randomization in each run
set.seed(i)

#shuffling the data
sdata=cleandata[sample(nrow(cleandata), nrow(cleandata)), ] 

#divide the dataset into training and test set
n=nrow(sdata)
trainIndex = sample(1:n, size = round(0.65*n), replace=FALSE)
train=sdata[trainIndex,]
test=sdata[-trainIndex,]

#summary of train and test data if needed.
#summary(train)
#summary(test)



#developing the RevHelper-RF fit
fit <- randomForest(as.factor(className) ~
                    
                    #all features considered  
                    #., 
                      
                    #textual features only
                    #  ReadingEase+ReadingEase.NL. +StopwordRatio+StopKeyRatio+	
                    #  QuestionRatio+ CodeElementRatio+ConceptualSimilarity
                      
                    #developer experience based features only 
                    #AuthorCommitsFile+ CommittedTwice + TotalAuthoredCommits+ ReviewingTwice +ReviewedCommitsFile +	TotalReviewedCommits
                    #+ ReviewedPRs +ExtLibSimilarity
                    
                    #optimal set of features
                    ConceptualSimilarity
                    +
                    ReviewedCommitsFile + AuthorCommitsFile +ExtLibSimilarity +
                    TotalReviewedCommits+ ReviewedPRs+StopwordRatio,  
                     
                    data=train, 
                    importance=TRUE, 
                    ntree=2000)


imp=importance(fit)
sumImp =sumImp + imp


#prediction model
Prediction <- predict(fit, test)


#calculate accuracy
cm=confusionMatrix(data=Prediction,
                   reference=test$class,
                   positive='u')


#show the confusion metrics if needed.
#print(cm)

#accumulating performance data from each run
sumAcc = sumAcc+  cm$overall['Accuracy']
sumPosPrec=sumPosPrec+ cm$byClass['Pos Pred Value']
sumPosRec=sumPosRec + cm$byClass['Sensitivity']
sumNegPrec=sumNegPrec + cm$byClass['Neg Pred Value']
sumNegRec=sumNegRec + cm$byClass['Specificity']

#showing performance from each run
print(c(cm$byClass['Pos Pred Value'],cm$byClass['Sensitivity'],cm$byClass['Neg Pred Value'],cm$byClass['Specificity'],cm$overall['Accuracy']) ) 

}

#showing average performance for 10 runs
print(sumPosPrec/10)
print(sumPosRec/10)
print(sumNegPrec/10)
print(sumNegRec/10)
print(sumAcc/10)

#showing average feature importance
myImp=sumImp/10
print(myImp)




