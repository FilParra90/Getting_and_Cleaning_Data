## Getting and Cleaning Data

## Course Project
 
The main objective of the final assignment of the course "Getting and Cleaning Data" is to create a script called ```run_analysis.R``` which performs the following 5 tasks:
 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
 
## Steps performed
 
In order to complete this project you must do the following:

1. Download the data source and put into a folder on your local drive. The folder should be named ```UCI HAR Dataset```.
2. Put ```run_analysis.R``` in the ```UCI HAR Dataset``` folder. then set it as your working directory using ```setwd("./Data Science Specialization/Getting and Cleaning Data/Final Assignment/UCI HAR Dataset/")```.
3. Run ```source("run_analysis.R")``` to obtain the tidy data.
 
## NOTES
To run```run_analysis.R``` you need the ```reshape2``` package and the ```data.table``` package. The script will automatically look if + those packages are present on your pc and, if they aren't, it will install them and load them. 
