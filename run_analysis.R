setwd("~/Projects/Coursera/Getting And Cleaning Data/Getting-and-Cleaning-Data-Course-Project/")
#Read all 3 train files
subject_train <- read.csv("UCI HAR Dataset/train/subject_train.txt", header=FALSE, col.names="Subject")
X_train  <- read.csv("UCI HAR Dataset/train/X_train.txt", header=FALSE, col.names="X")
y_train  <- read.csv("UCI HAR Dataset/train/y_train.txt", header=FALSE, col.names="y")

#Read all 3 test files
subject_test <- read.csv("UCI HAR Dataset/test/subject_test.txt", header=FALSE, col.names="Subject")
X_test  <- read.csv("UCI HAR Dataset/test/X_test.txt", header=FALSE, col.names="X")
y_test  <- read.csv("UCI HAR Dataset/test/y_test.txt", header=FALSE, col.names="y")

#Bind columns for test and train
train <- cbind(subject_train, X_train, y_train)
test <- cbind(subject_test, X_test, y_test)

#Bind test and train
all <- rbind(train, test)