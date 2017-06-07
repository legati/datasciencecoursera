#Data input

#trainUrl <- "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv"
#testUrl <- "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv"
#download.file(trainUrl, destfile = 'train.csv')
#download.file(testUrl, destfile = 'test.csv')

training <- read.csv('pml-training.csv')
testing <- read.csv('pml-testing.csv')


#Exploratory Data Analysis
str(training)
summary(training)
names(training)

#Cleaning data
excludeNames <- c('X', 'user_name', 'new_window', "num_window", 
                  'raw_timestamp_part_1', 'raw_timestamp_part_2', 'cvtd_timestamp')
moreNames<- grep('std|var|skewness|kurtosis', names(training), value = TRUE)
excludeNames <- c(excludeNames, moreNames)
training1 <- training[-which(names(training) %in% excludeNames)]

#Variable Importance
training1 <- training1[sample(nrow(training1)),]
minitrain <- training1[1:200,]

fun1 <- function(x){
  list <- c()
  w <- ncol(x)
  l <- nrow(x)
  for (i in 1:w){
    if (sum(nzchar(as.character(x[,i]))*1)!=l) {
      list <- c(list, i)
    }
  }
list
}


which(colSums(is.na(minitrain))!=0, arr.ind = TRUE) -> a
minitrain <- minitrain[, -a]
b <- fun1(minitrain)
minitrain1 <- minitrain[,-b]


library(caret)
library(rpart)

rfMod <- train(classe ~ ., data = minitrain1, method = 'rf')
varImp(rfMod) -> vIm
as.data.frame(vIm$importance) -> vImdf
asdf <- data.frame(Names = rownames(vImdf), Importance = vImdf$Overall)
asdf[order(-asdf$Importance),]
as.character(asdf$Names[1:4]) -> importantPredictors
finalSet <- c(importantPredictors, 'classe')

final_training <- training[which(names(training) %in% finalSet)]

inTrain <- createFolds(final_training$classe, k = 5)
str(inTrain)

control <- trainControl(method = 'repeatedcv', number = 10, repeats = 1)
finMod <- train(classe ~ ., data = final_training, method = 'rf', 
                trControl = control)
finMod
finMod$results$Accuracy[1]

pred <- predict(finMod, testing)
pred

