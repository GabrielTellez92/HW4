# Gabriel Tellez
# Homework 1 and 4 - Getting Clean Data

library(dplyr)

#################################################
# READ ALL NECESSARY TXT FILES
# WD set to Tools and Techniques folder on local computer
# reading X_train = training set
train.X = read.table("Assignments/hw1and4/train/X_train.txt")
#reading y_train = training labels
train.y = read.table("Assignments/hw1and4/train/y_train.txt")
# reading X_test = test set
test.X = read.table("Assignments/hw1and4/test/X_test.txt")
# reading y_test = test labels
test.y = read.table("Assignments/hw1and4/test/y_test.txt")

# reading features file
features = read.table("Assignments/hw1and4/features.txt")
# reading activity_labels file
activity.labels = read.table("Assignments/hw1and4/activity_labels.txt")
# reading subject who performed activity files
subject.train = read.table("Assignments/hw1and4/train/subject_train.txt")
subject.test = read.table("Assignments/hw1and4/test/subject_test.txt")
#################################################
#################################################
# TRAIN DATA SET
# combining subject.train with train.X
# this adds column identifying the subject who performed the activity; range 1:30
# added column V1100
train.subject = bind_cols(subject.train, train.X)
# combining train.y with train.subject
# this shows what rows correspond to what activity done by each subject; range 1:6
# added column v1101
train.number = bind_cols(train.y, train.subject)
# merge activity.labels with train.number by first column which is the activity number
# this adds the descriptive activity names for each activity number
train.label = merge(activity.labels, train.number, by = "V1")

# TEST DATA SET
# same three steps done on test data set
test.subject = bind_cols(subject.test, test.X)
test.number = bind_cols(test.y, test.subject)
test.label = merge(activity.labels, test.number, by = "V1")
#################################################
#################################################
# FULL DATA SET
# combining training and testing data to make one full data set
all.data = bind_rows(train.label, test.label)

# add descriptive variable names using features txt file
# first, add three new variable names to features file
row1 = data.frame(V1 = 1, V2 = "Subject_Number")
features = rbind(row1, features)
row2 = data.frame(V1 = 2, V2 = "Activity_Label")
features = rbind(row2, features)
row3 = data.frame(V1 = 3, V2 = "Activity_Number")
features = rbind(row3, features)

# integrate features with full data set
names(all.data) = features$V2
#################################################
#################################################
# MEAN AND STD DEV MEASUREMENTS
variables = colnames(all.data)
mean.std = grepl("Activity_Label", variables) | grepl("Subject_Number", variables) | 
  grepl("mean[^F]", variables) | grepl("std..", variables)

mean.std.only = all.data[ , mean.std == TRUE]
#################################################
#################################################
# creating data set with the average of each variable for each activity and each subject
tidy = aggregate(. ~ Activity_Label + Subject_Number, mean.std.only, mean)

#################################################
#################################################
# create txt file for submission
write.table(tidy, row.names = FALSE, "tidy.txt")


