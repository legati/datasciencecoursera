# Getting and Cleaning Data Course Project

## Code book

### Description

The "run_analysis.R" script (below - 'the script') has been developed using RStudio ver. 0.99.486 
based on R version 3.2.3 (2015-12-10) at x86_64-pc-linux-gnu platform.

The script performs following actions:

1. Downloads the input data from url given in the project task description.
2. Unpacks downloaded .zip package
3. Loads 'dplyr' package for R
4. Reads input data and saves it in data frame variables (see 'Variables' section below).
5. Binds 'test' and 'train' data sets together.
6. Changes numeric values in activity data frame 'y' to the explicit activity names.
7. Labels columns in value data frame 'X' with descriptive variable names.
8. Extracts 'mean()' and 'std()' variables and creates subset data frame, binded with subject and activity columns.
9. Creates new data frame containing average values of every variable for each activity and each subject.


### Variables

* 'X_train', 'y_train', 'X_test', 'y_test', 'subject_train' and 'subject_test' contain the data from input files.
* 'features' and 'activity_labels' contain names for variables and activities
* 'X' - all variables from train and test part combined, initial column names changed in accordance with 'features' table  
* 'y' - all activities from train and test part combined, initial activity numeric values changed to activity descriptions
  in accordance with 'activity_labels' table
* 'subject' - list of all subjects, test and train parts combined
* 'vec' - intermidiate character vector containing names of variables NOT containing 'mean()' or 'std()'.
* 'totalData' - result of binding 'Subject', 'y', and 'X' together
* 'output' - resulting tidy data set containing average values of every variable for each activity and each subject

