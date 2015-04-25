library(dplyr)

## Merge the training and the test sets to create one data set.

subjecttest <- read.table("/test/subject_test.txt")
xtest <- read.table("/test/X_test.txt")
ytest <- read.table("/test/y_test.txt")

subjecttrain <- read.table("/train/subject_train.txt")
xtrain <- read.table("/train/X_train.txt")
ytrain <- read.table("/train/y_train.txt")

subjectdata <- rbind(subjecttest, subjecttrain)
xdata <- rbind(xtest, xtrain)
ydata <- rbind(ytest, ytrain)

## Extract only the measurements on the mean and standard deviation for each measurement. 

features <- read.table("/features.txt")
meanandstd <- grep("-(mean|std)\\(\\)", features[, 2])
xdata <- xdata[, meanandstd]
names(xdata) <- features[meanandstd, 2]

## Use descriptive activity names to name the activities in the data set.

activitylabels <- read.table("activity_labels.txt")


ydata[, 1] <- activitylabels[ydata[, 1], 2]
names(ydata) <- "activity"

## Appropriately label the data set with descriptive variable names. 

names(subjectdata) <- "subject"
alldata <- cbind(xdata, ydata, subjectdata)

## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

averages <- ddply(alldata, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(averages, "averages.txt", row.name=FALSE)