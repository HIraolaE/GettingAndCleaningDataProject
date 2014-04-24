source("DownloadDataSet.R") ## load downloadDataSet() function
source("GetMeansFunction.R") ## load getMeansDF(x) function 

##Download data set. It can be commented after the first execution.
downloadDataSet()

##read training and test sets as tables
## x values(feautres) y values(activities) and subject values are read

xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt") 
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt") 
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt") 
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt") 
subjecttrain <- read.table("./UCI HAR Dataset/train/subject_train.txt") 
subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt") 

##Combine test and training sets.
x <- rbind(xtrain, xtest)
y <- rbind(ytrain, ytest)
subject <- rbind(subjecttrain, subjecttest)

##Add names to the subject table
names(subject) <- "Subject"

##Obtain feature names and find which features should be select(only mean and std)
##1. Read feature names from file
features <- readLines("UCI\ HAR\ Dataset/features.txt")
##2. Separate into two strings. One contains the number and one the name
##and convert it into a matrix
features <- sapply(features, function(x) strsplit(x, split=" "))
output <- matrix(unlist(features), ncol = 2, byrow = TRUE)
##3. Select the column with the names
names(x) <- output[,2]
##4. Create a booolean vector with the same length of features list
## it will be true if feature name contains mean(). It will be used to select features
containsMean <- grepl("mean()",output[,2]) ## true if contains mean() and meanFreq()
containsMeanFreq <- grepl("Freq()",output[,2]) ## true if contains meanFreq()
containsMeanOnly <- containsMean & !(containsMean & containsMeanFreq) ## true only if contains mean()
##5. Create a booolean vector with the same length of features list
## it will be true if feature name contains mean(). It will be used to select features
containsStd <- grepl("std()",output[,2])

## Select the mean and std features
xSel <- x[,containsMean | containsStd]

## substitute activity faactors(numbers in y) by labels
## Obtain the activity labels
activities <- readLines("UCI\ HAR\ Dataset/activity_labels.txt")
activities <- sapply(activities, function(x) strsplit(x, split=" "))
activities <- matrix(unlist(activities), ncol = 2, byrow = TRUE)
## Subsititute numeric values by labels
activitieslabels <- lapply(y, function(x) activities[,2][x])
names(activitieslabels) <- "Activity"

## Combine all the data, subject selected features and activity labels int o a tidy df
tidydf <- cbind(subject,xSel,activitieslabels)
## Split the tidy dataframe by subject and activity to obtain the means in the features
tidydf2 <- split(tidydf, tidydf[,c('Subject','Activity')])



##call to the function and obtain the means data frame
meansDataFrame <- getMeansDF(tidydf2)

## Write the data frames into csv files
write.csv(file = "tidyDataFrame.txt", x=tidydf)
write.csv(file = "meansTidyDataFrame.txt", x=meansDataFrame)

