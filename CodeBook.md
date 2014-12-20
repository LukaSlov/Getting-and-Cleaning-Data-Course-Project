#Code Book

##Variable Names
###Subject
Identifier of the person doing the activity with values from 1 to 30.
###Activity
One of six different activities  (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
### Vector with time and frequency domain variables. 
A 561-feature vector with time and frequency domain variables.  Reduced to 79 after tidying the dataset.

##Data
[Data Source](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

##Data Transformation
###1. Merges the training and the test sets to create one data set.
Data was collected from 6 files (3 training and 3 test sets). Train and test set were first merged by adding a column with "Subject" variable and a column with "Activity" variable to the 561-feature vector. The two sets were then bind together by appending rows from one set to the end of the other.

###2. Extracts only the measurements on the mean and standard deviation for each measurement. 
In this step only column names that match "std" and "mean" were kept with addition of "Subject" and "Activity" variables.

###3. Uses descriptive activity names to name the activities in the data set
The 1, 2, 3..6 activity names were replaced with human readable names (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).

###4. Appropriately labels the data set with descriptive variable names. 
This step was taken care at the beginning of the code by applying names from features.txt to the names of the train and test X set.

###5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
To complete this step I used a function aggregate. I was grouping by a combination of Subject and Activity and calculated a mean for each of the 79 features.