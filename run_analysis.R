#Downloading and extracting the data frame
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./proj.zip")
unzip("./proj.zip")

library(dplyr)

read.table('./UCI HAR Dataset/test/X_test.txt') -> X_test
read.table('./UCI HAR Dataset/test/y_test.txt') -> y_test

read.table('./UCI HAR Dataset/train/y_train.txt') -> y_train
read.table('./UCI HAR Dataset/train/X_train.txt') -> X_train

read.table('./UCI HAR Dataset/train/subject_train.txt') -> subject_train
read.table('./UCI HAR Dataset/test/subject_test.txt') -> subject_test

features <- read.table("./UCI HAR Dataset/features.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", stringsAsFactors = F)

#Binding together 'subject_test' and 'subject_train' data frames
subject <- rbind(subject_test, subject_train)
# renaming the column in 'subject' data frame
names(subject)[1] <- "Subject"

#Binding together 'y_test' and 'y_train' data frames
y <- rbind(y_test, y_train)
# renaming the column in 'y' data frame
names(y)[1] <- "Activity"

#Binding 'X_test' and 'X_train' data frames
X <- rbind(X_test, X_train)

# changing values in 'y' from numbers to activity names in accordance with 'activity_labels' data frame
for (k in 1:nrow(y)) {
  for (m in 1:nrow(activity_labels)) {
    if (y[k,1] == activity_labels[m,1]) {
      y[k,1] <- activity_labels[m,2]
      next
    }
  }
}

#Renaming columns in 'X' data frame in accordance with each variable name taken from 'features' data frame
for (i in 1:ncol(X)) {
  names(X)[i] <- as.character(features[i,2])  
}

#extracting the names of columns with mean() and std() variables into character vector 'vec'
vec = vector(mode = 'character')
for (j in 1:ncol(X)) {
  if ((grepl("*-mean()-*", names(X)[j]) | grepl("*-std()-*", names(X)[j])) == FALSE) {
    vec = c(vec, names(X)[j])
    }  
}

#binding together subject No, activity name and variables
totalData <- cbind(subject, y, X[,!(names(X) %in% vec)])

#getting output data set with average values of every variable for each activity and each subject
output <- totalData %>%
  arrange(Subject, Activity) %>%
  group_by(Subject, Activity) %>%
  summarise_each(funs(mean))

#Creating a .txt file with final dataset
write.table(output, file = './outputDS.txt', row.names = FALSE)
