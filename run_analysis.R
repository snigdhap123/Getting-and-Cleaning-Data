library(reshape2)

filename <- "getdata_dataset.zip"
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  download.file(fileURL, filename, mode="wb")
}  

# Load the datasets features,x_test,x_train,y_test,y_train

features <- read.table("getdata_dataset/UCI HAR Dataset/features.txt")

x_readtest <- read.table("getdata_dataset/UCI HAR Dataset/test/X_test.txt", col.names=features[,2])
x_readtrain <- read.table("getdata_dataset/UCI HAR Dataset/train/X_train.txt", col.names=features[,2])
x_test_train <- rbind(x_readtest, x_readtrain)


y_readtest <- read.table("getdata_dataset/UCI HAR Dataset/test/y_test.txt", col.names = c('activity'))
y_readtrain <- read.table("getdata_dataset/UCI HAR Dataset/train/y_train.txt", col.names = c('activity'))
y_test_train <- rbind(y_readtest, y_readtrain)


#Extracts only the  data on mean and standard deviation

features_mean_std <- features[grep("(mean|std)\\(", features[,2]),]
mean_and_std <- x_test_train[,features_mean_std[,1]]

#Activity grouped 
activitylabels <- read.table("getdata_dataset/UCI HAR Dataset/activity_labels.txt")
y_test_train$activity<-factor(y$activity, levels = activitylabels[,1], labels = activitylabels[,2])


#Merge Datasets and add labels 

x_y_with_labels <- cbind(y_test_train, x_test_train)
mean_and_std_with_labels <- cbind(y_test_train, mean_and_std)

# Load the subject dataset 
subject_readtest <- read.table("getdata_dataset/UCI HAR Dataset/test/subject_test.txt", col.names = c('subject'))
subject_readtrain <- read.table("getdata_dataset/UCI HAR Dataset/train/subject_train.txt", col.names = c('subject'))
subject <- rbind(subject_readtest, subject_readtrain)

# average of each variable for each activity and each subject. 
   
averages <- aggregate(x_test_train, by = list(activity = y_test_train[,1], subject = subject[,1]), mean)

write.csv(averages, file='getdata_dataset/tidy_dataset.txt', row.names=FALSE)

