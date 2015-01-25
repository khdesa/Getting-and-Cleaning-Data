library(data.table)
library(reshape2)

labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
features <- read.table("./UCI HAR Dataset/features.txt")[,2]

#Load the Test and Train datasets 
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt") 


names(X_test) = features
names(X_train) = features

#Extracts only the measurements on the mean and standard deviation for each measurement.

measurements <- grepl("mean|std", features)
X_test = X_test[,measurements]
X_train = X_train[,measurements]


# Uses descriptive activity names to name the activities in the data set.
y_test[,2] = labels[y_test[,1]]
names(y_test) <- c("Activity_Id", "Activity_Label")
names(subject_test) = "Subject"
y_train[,2] = labels[y_train[,1]]
names(y_train) <- c("Activity_Id", "Activity_Label")
names(subject_train) = "Subject"


test_data <- cbind(as.data.table(subject_test), y_test, X_test)
train_data <- cbind(as.data.table(subject_train), y_train, X_train)

#Merges the training and the test sets to create one data set.

data <- rbind(test_data, train_data)

#Appropriately labels the data set with descriptive activity names.

ids <- c("Subject", "Activity_Id", "Activity_Label")
set_labels <- setdiff(colnames(data), ids)
new_data <- melt(data, id = ids, measure.vars = set_labels)

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidy_dataset <- dcast(new_data, Subject + Activity_Label ~ variable, mean)
write.table(tidy_dataset, file = "./tidy_dataset.txt", row.name=FALSE)
