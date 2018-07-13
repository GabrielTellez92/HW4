# Homework 4 - Cleaning Data (Revisited)

Human Activity Recognition Using Smartphones Dataset

I divided this assignment into six sections. Each section is clearly separated by '#' in the R code. The first section reads all the necessary text files. 

In the second section, I combined all the training data sets together and all the test sets together. Specifically, I combined the training data set that had no labels for rows or columns with the subject data set. That identyfied the subject that performed the activity for each row. The range for the new column is 1:30. After that, the activity data set was combined and that added what activity was done by each subject. The range for this new column is 1:6. Lastly, I merged the the activity labels to add the descriptive activity name for each activity number that was added in the previous step. This process was repeated for the test data sets. At the end of this section, I had two data sets: one with all the training data (labelled with subject, activity number, and activity label) and one with all the test data (labelled with subject, activity number, and activity label).

In the third section, I combined the training data with the test data to get one full data set. In this section, I also changed the names of the first three columns that were added in section two to be more descriptive: Subject_Number, Activity_Label, and Activity_Number. Once that was done, I integrated the features file with the full data set. This results in the full data set having all descriptive variable names.

In the fourth section, I read in all the columns with their descriptive names and separated the ones of interest: Activity_Label, Subject_Number, all mean variables, and all std variables. At the end, a data set with just those variables was created.

In the fifth section, I created a data set with the average of each variable for each activity and each subject. The result is a dataset with 180 observations and 68 variables.

Finally, in the sixth section, the dataset is written into a tidy text file.
