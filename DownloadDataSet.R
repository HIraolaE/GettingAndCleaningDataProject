## Download & Unzip files
downloadDataSet <- function() {
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileUrl,"Dataset.zip", method="curl")
  unzipped <- unzip("Dataset.zip")
}
  
  
  
