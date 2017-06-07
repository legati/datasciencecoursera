library(AppliedPredictiveModeling)
data(segmentationOriginal)
library(caret)

#inTrain = createDataPartition(y = segmentationOriginal$Case, p = 0.5, list = FALSE)
testing <- segmentationOriginal[segmentationOriginal$Case=='Test',]
training <- segmentationOriginal[segmentationOriginal$Case=='Train',]

set.seed(125)
modFit <- train(Class ~ ., method = 'rpart', data = training)

library(dplyr)

a <- data.frame(TotalIntenCh2 = 23000, FiberWidthCh1 = 10, PerimStatusCh1=2)
modFita <- train(Class ~ TotalIntenCh2 + FiberWidthCh1 + PerimStatusCh1, data = training,
                 method = 'rpart')
testa <- predict(modFita, a)
testa

b <- data.frame(TotalIntenCh2 = 50000, FiberWidthCh1 = 10, VarIntenCh4=100)
modFitb <- train(Class ~ TotalIntenCh2 + FiberWidthCh1 + VarIntenCh4, data = training,
                 method = 'rpart')
testb <- predict(modFitb, b)
testb

c <- data.frame(TotalIntenCh2 = 57000, FiberWidthCh1 = 8, VarIntenCh4=100)
modFitc <- train(Class ~ TotalIntenCh2 + FiberWidthCh1 + VarIntenCh4, data = training,
                 method = 'rpart')
testc <- predict(modFitc, c)
testc

d <- data.frame(FiberWidthCh1 = 8, VarIntenCh4 = 100, PerimStatusCh1=2)
modFitd <- train(Class ~ FiberWidthCh1 + VarIntenCh4 + PerimStatusCh1, data = training,
                 method = 'rpart')
testd <- predict(modFitd, d)
testd  
  
testa1 <- predict(modFit, a)

#Question 3

library(pgmm)
data(olive)
olive = olive[,-1]

newdata = as.data.frame(t(colMeans(olive)))

oliveFit <- train(Area ~ ., method = 'ctree', data = olive)
predolive <- predict(oliveFit, newdata)

#Question 4

library(ElemStatLearn)
data(SAheart)
set.seed(8484)
train = sample(1:dim(SAheart)[1],size=dim(SAheart)[1]/2,replace=F)
trainSA = SAheart[train,]
testSA = SAheart[-train,]

missClass = function(values,prediction)
  {sum(((prediction > 0.5)*1) != values)/length(values)}

set.seed(13234)
heartFit <- train(chd ~ age + alcohol + obesity + tobacco + typea + ldl, 
                  method = 'glm', family = 'binomial', data = trainSA)

predtrain <- predict(heartFit, trainSA)
predtest <-predict(heartFit, testSA)

MCtrain <- missClass(trainSA$chd, predtrain)
MCtest <- missClass(testSA$chd, predtest)

#Question 5
library(ElemStatLearn)
data(vowel.train)
data(vowel.test)

names(vowel.train)
vowel.train$y <- factor(vowel.train$y)
vowel.test$y <- factor(vowel.test$y)

class(vowel.test$y)

set.seed(33833)
vowelFit <- train(y ~ ., data = vowel.train, method = 'rf', 
                  importance = TRUE, verbose = TRUE)
vowelFit1 <- cforest(y ~ ., data = vowel.train)
vowelFit2 <- randomForest(y ~ ., data = vowel.train, importance = TRUE)

varimp0 <- varimp(vowelFit$finalModel)
varimp1 <- varimp(vowelFit1)
varimp2 <- varimp(vowelFit2)
