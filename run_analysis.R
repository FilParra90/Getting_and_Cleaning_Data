#  run_analysis
cat("\014"); rm(list = ls())

###########################################################################
# Author: Filippo Parravicini
# email: filippo.parravicini90@gmail.com
# Course: Getting and Cleaning Data
#
# This script performs the following tasks:
#
# 1. Merges the training and the test sets ti create a single data set
# 2. Extracts only the measurements on the mean and standard deviation for
#       each measurement
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names
# 5. From the data set in step 4, creates a second, independent tidy data 
#       set with the average of each variable for each activity and each
#       subject.
###########################################################################
## Packages
if (!require("data.table")) {
        install.packages("data.table")
}

if (!require("reshape2")) {
        install.packages("reshape2")
}

library(data.table); library(reshape2)

###########################################################################
## Load and Adjust Data 
#setwd("./Data Science Specialization/Getting and Cleaning Data/
#      Final Assignment/UCI HAR Dataset/")

# Activity Labels
Activity_Labels <- read.table("./activity_labels.txt")
Activity_Labels <- Activity_Labels$V2

# Column names
Features <- read.table("./features.txt")
Features <- Features$V2

# Load X_test, y_test & subject_test
X_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
subject_test <- read.table("./test/subject_test.txt")
names(X_test) <- Features

y_test$V2 <- Activity_Labels[y_test$V1]
names(y_test) <- c("Activity_Num", "Activity_Des")

names(subject_test) <- "Subject"

Test_data <- cbind(as.data.table(subject_test), y_test, X_test)

# Load X_train, y_train & subject_train
X_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt") 
subject_train <- read.table("./train/subject_train.txt")
names(X_train) <- Features

y_train$V2 <- Activity_Labels[y_train$V1]
names(y_train) <- c("Activity_Num", "Activity_Des")

names(subject_train) <- "Subject"

Train_data <- cbind(as.data.table(subject_train), y_train, X_train)

###########################################################################
## Step 1: Merge training and test sets
Tidy_data <- as.data.frame(rbind(Test_data,Train_data))

###########################################################################
## Step 2: Extract measurements on mean and std deviation for each 
##      measurement
Mean_or_Std <- grepl("mean|std", names(Tidy_data))
Mean_or_Std[1:3] = TRUE

Tidy_data <- Tidy_data[,Mean_or_Std]

###########################################################################
## Step 3: Uses descriptive activity names to name the activities in the 
##      data set

# Done Already!

###########################################################################
## Step 4: Appropriately labels the data set with descriptive variable 
##      names

# Done Already

###########################################################################
## Step 5: From the data set in step 4, creates a second, independent tidy 
##      data set with the average of each variable for each activity and 
##      each subject
lables <- c("Subject", "Activity_Num", "Activity_Des")
data_melt <- melt(Tidy_data, id = lables)
New_tidy_data <- dcast(data_melt,Subject + Activity_Des ~ variable, mean)

###########################################################################
## Write Tidy_Data.txt
write.table(New_tidy_data, file = "./Tidy_Data.txt")