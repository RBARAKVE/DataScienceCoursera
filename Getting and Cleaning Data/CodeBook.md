run_analysis.R

This code performs 5 steps:

1. Merges similar data by sets subject, x and y.
2. Extracts mean and standard deviation columns and labels them with appropriate features.
3. Substitutes activity names with activity names and IDs from activity_labels.txt.
4. Corrects column names.
5. Genertes a new dataset (averages.txt) of averages for each subject and activity.

The variables:

“xtrain”, “xtest”, “ytrain”, “ytest”, “subjecttrain” and “subjecttest” are the datasets downloaded.
“xtrain” and “xtest”, “ytrain” and “ytest”, “subjecttrain” and “subjecttest” are merged into “xdata”, “ydata” and “subjectdata” respectively.
“features” contains the correct names for “xdata” and “meanandstd” extracts the proper data from it.
“all data” function merges “xdata”, “ydata” and “subjectdata” together.
“averages” contains the desired averages to be stored in a .txt file.