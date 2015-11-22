x_readtest :Load the dataset x_test
y_readtest :Load the dataset y_test 
y_readtrain:Load the dataset x_train
x_readtrain:Load the dataset y_train

features : Load the dataset features
activitylabels : Load the dataset activity_labels
subject_readtest : Load the dataset subject_test

x_test_train:rowbind x_readtest & x_readtrain 
y_test_train:rowbind y_readtest & y_readtrain

features_mean_std :find mean and standard deviation from dataset features
mean_and_std :find mean and standard deviation  on x_test_train

y$activity :Activity grouped

x_y_with_labels :column bind y_test_train & x_test_train

mean_and_std_with_labels: column bind y_test_train & mean_and_std


subject_readtest:Load the dataset subject_test
subject_readtrain:Load the dataset subject_train
subject :rowbind subject_readtest & subject_readtrain

averages :find the average each activity and each subject
