#Question 1

library(ElemStatLearn)
data(vowel.train)
data(vowel.test)

vowel.train$y <- factor(vowel.train$y)
vowel.test$y <- factor(vowel.test$y)

set.seed(33833)

#Fit (1) a random forest predictor relating the factor variable y to 
#the remaining variables and (2) a boosted predictor using the "gbm" method. 
#Fit these both with the train() command in the caret package.
#What are the accuracies for the two approaches on the test data set? 
#What is the accuracy among the test set samples where the two methods agree?

library(caret)
library(randomForest)
q1mod1 <- train(y ~ ., data = vowel.train, method = 'rf')
q1pred1 <- predict(q1mod1, vowel.test)
cM1 <- confusionMatrix(q1pred1, vowel.test$y)
cM1$overall

library(gbm)
q1mod2 <- train(y ~ ., data = vowel.train, method = 'gbm')
q1pred2 <- predict(q1mod2, vowel.test)
cM2 <- confusionMatrix(q1pred2, vowel.test$y)
cM2$overall
  
q1agr <- q1pred1[which(q1pred1 == q1pred2)]
cMagr <- confusionMatrix(q1agr, vowel.test$y[which(q1pred1 == q1pred2)])
cMagr$overall

#Answer: rf = 5.8, gbm = 5.1, ag = 6.15`

#Question 2
library(caret)
library(gbm)
set.seed(3433)
library(AppliedPredictiveModeling)
data(AlzheimerDisease)

adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
trainingddd = adData[ inTrain,]
testingddd = adData[-inTrain,]

set.seed(62433)
# predict diagnosis with all the other variables using a random forest ("rf"), 
# boosted trees ("gbm") and linear discriminant analysis ("lda") model. 
#Stack the predictions together using random forests ("rf"). 
#What is the resulting accuracy on the test set? Is it better or worse 
#than each of the individual predictions?

library(caretEnsemble)
control <- trainControl(savePredictions = TRUE, classProbs = TRUE)
algoList <- c('rf', 'gbm', 'lda')
models <- caretList(diagnosis ~ ., data = training, 
                    methodList = algoList, trControl = control)
results <- resamples(models)
summary(results)
dotplot(results)
modelCor(results)

predictions <- predict(models, testing)
dim(predictions)

control <- trainControl(savePredictions = TRUE, classProbs = TRUE)
rfFit <- train(diagnosis ~ ., data = training, method = 'rf', trControl = control)
rfPred <- predict(rfFit, testing)
table(rfPred, testing$diagnosis)
#rf Accuracy - 0.768

gbmFit <- train(diagnosis ~ ., data = training, method = 'gbm', trControl = control)
gbmPred <- predict(gbmFit, testing)
table(gbmPred, testing$diagnosis)
#gbm accuracy - 0.793

ldaFit <- train(diagnosis ~ ., data = training, method = 'lda', trControl = control)
ldaPred <- predict(ldaFit, testing)
ldaTab <- table(ldaPred, testing$diagnosis)
(ldaTab[1,1]+ldaTab[2,2])/sum(ldaTab)
#lda accuracy - 0.768

stack <- data.frame(rfPred, gbmPred, ldaPred, diagnosis = testing$diagnosis)
#stackControl <- trainControl(classProbs=TRUE)
stack.rf <- train(diagnosis ~ ., data = stack, method = 'rf')
summary(stack.rf)
#Accuracy - 0.741
#Question 3
set.seed(3523)
library(AppliedPredictiveModeling)
library(caret)
data(concrete)

inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
training = concrete[ inTrain,]
testing = concrete[-inTrain,]

set.seed(233)

lassFit <- train(CompressiveStrength ~ ., data = training, method = 'lasso')
x <- as.matrix(subset(training, select = -c(CompressiveStrength)))
y <- as.matrix(subset(training, select = c(CompressiveStrength)))
enetFit <- enet(x, y, lambda = 0)
plot.enet(enetFit, xvar = c('penalty'), use.color = TRUE)

#Answer - cement

#Question 4
library(lubridate) # For year() function below

Url <- 'https://d396qusza40orc.cloudfront.net/predmachlearn/gaData.csv'
download.file(Url, destfile = 'gaData.csv')
dat = read.csv('gaData.csv')
training = dat[year(dat$date) < 2012,]
testing = dat[(year(dat$date)) > 2011,]
tstrain = ts(training$visitsTumblr)
tstest = ts(testing$visitsTumblr)

library(forecast)
q4mod <- bats(tstrain)
q4fcast <- forecast(q4mod, h = 235, level = 95)
accuracy(q4fcast, testing$visitsTumblr)

count <- 0
for (i in 1:235){
  if ((testing$visitsTumblr[i] > q4fcast$lower[i]) 
      & (testing$visitsTumblr[i] < q4fcast$upper[i]))
    { 
    count <- count + 1
    }
}

result3 <- c()
l <- length(q4fcast$lower)

for (i in 1:l){
  x <- testing$visitsTumblr[i]
  a <- q4fcast$lower[i] < x & x < q4fcast$upper[i]
  result3 <- c(result3, a)
}

sum(result3)/l * 100
#Answer - 96%

#Question 5

set.seed(3523)
library(AppliedPredictiveModeling)
library(caret)
data(concrete)

inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
training = concrete[ inTrain,]
testing = concrete[-inTrain,]

set.seed(325)
library(e1071)
svmFit <- svm(CompressiveStrength ~ ., data = training)
svmPred <- predict(svmFit, testing[, -9])
RMSE(svmPred, testing[,9])
#Answer 6.715

