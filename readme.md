An R script called run_analysis.R that does the following:

1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement.
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive activity names.
5.Creates a second, independent tidy data set with the average of each variable for each activity and   each subject.


The approach is as follows:

1.Download the datasets and add labels 
2.rbind() to do the row bind on the dataset x_test.txt,x_train.txt,y_test.txt,y_train.txt
3.Read only std() and mean() from features dataset , subset the dataset .
4.Load the activity dataset and grouped the rows 
5.Merge Datasets using cbind doing that for both mean_and_std and x .
6.Load the subject dataset and calculating an average on activity and subject using aggregate() .
7.save the result to a file