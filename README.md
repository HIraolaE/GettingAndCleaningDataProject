GettingAndCleaningDataProject
=============================

Repository to save the project of the course Getting and Cleaning Data from Johns Hopkins University at Coursera.

Scripts
-------
There 3 R scripts in the repository.

run_analysis.R: it is responsbile to perfor all the steps exaplained in the project. It calls to the functions defined on the other two scripts.
DownloadDataSet.R: Defines a function to download and unzip the dataset.
GetMeansFunction.R: Takes the tidy data splited by subject and activity as described in the project description and computes the means creating a new data frame.

Tidy Data frame
---------------
tidyDataFrame.txt: Tidy data frame created by all the data into the train and test data sets. It has one column that corresponds to the subject, 79 columns corresponding to the features and one column corresponding to the activity. (It is explained in the code book).

meansTidyDataFrame.txt: It contains a data frame with the same columns as the tidy data frame explained above. However, in this case all the feature columns are filled by the mean values of the features taken by subject and activity.

Data
----
UCI HAR Dataset: Contains the dataset as downloaded and unzipped from the origin.
