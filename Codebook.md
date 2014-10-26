 You should create one R script called run_analysis.R that does the following. 
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Read the raw data to memory
Join together the test and train data
Built activity labels
Clean feature naming
Calutate means and std devs
Output

Variables:
subj_train 
y_train 
x_train 
subj_test
y_test 
x_test
subjects
x
y
features
mean_features
names
activity_labels
data
mean_std
tidy_data
