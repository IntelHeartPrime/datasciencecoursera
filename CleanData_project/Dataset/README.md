The following are the requirements：

1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement.
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names.
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

So I do these for  first tidy dataset：
    
    1.use the grep to extract the information and index of the measurements on the mean and standrad deviation from the "features.txt"
    2.distract data from the "X_test.txt" and "X_train.txt" by the vector from step1
    3.replace the activity id to descriptive activity names
    4.create a DataFrame of Appropriately labels and write it to "Dataset1.txt"
    
then I do these for second tidy dataset:
    1.
