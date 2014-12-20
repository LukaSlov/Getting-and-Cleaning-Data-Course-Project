setwd("~/Projects/Coursera/Getting And Cleaning Data/Getting-and-Cleaning-Data-Course-Project/Getting-and-Cleaning-Data-Course-Project/")
### 1. Merges the training and the test sets to create one data set. ###

#Read feature names
x_names <- unlist(read.csv("UCI HAR Dataset/features.txt", sep="\n", header=FALSE))

#Read all 3 train files
subject_train <- read.csv("UCI HAR Dataset/train/subject_train.txt", header=FALSE, col.names="Subject")
y_train  <- read.csv("UCI HAR Dataset/train/y_train.txt", header=FALSE, col.names="Activity")
X_train  <- read.csv("UCI HAR Dataset/train/X_train.txt", header=FALSE, sep = "")
names(X_train) <- x_names

#Read all 3 test files
subject_test <- read.csv("UCI HAR Dataset/test/subject_test.txt", header=FALSE, col.names="Subject")
y_test  <- read.csv("UCI HAR Dataset/test/y_test.txt", header=FALSE, col.names="Activity")
X_test  <- read.csv("UCI HAR Dataset/test/X_test.txt", header=FALSE, sep = "")
names(X_test) <- x_names


#Bind columns for test and train
train <- cbind(subject_train, y_train, X_train)
test <- cbind(subject_test, y_test, X_test)

#Bind test and train
all <- rbind(train, test)


### 2. Extracts only the measurements on the mean and standard deviation for each measurement.  ###

#Extract  std, mean + keep Activity and Subject
all <- all[, c(1, 2, grep("(std)|(mean)", names(all)))]

### 3. Uses descriptive activity names to name the activities in the data set ###

#Make a vector of activities where index corresponds to activity
activities <- c('WALKING', 'WALKING_UPSTAIRS', 'WALKING_DOWNSTAIRS', 'SITTING', 'STANDING', 'LAYING')
all$Activity <- activities[all$Activity]

### 4. Appropriately labels the data set with descriptive variable names.  ###
# I have taken care of this step in lines 11 and 18 as I was reading data, to make step 3 easier #

### 5. From the data set in step 4, creates a second, independent tidy data ###
### set with the average of   each variable for each activity and each subject. ###

averages <- aggregate(all[,3:dim(all)[2]], by=list(Activity = all$Activity, Subject = all$Subject), FUN=mean)
#Look through dataset all
#Group by Activity and Subject
#Calculate mean for all columns (except first two)

#write table to text file
write.table(averages, "averages.txt", row.name=FALSE)