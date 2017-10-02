######## 
## Downloads, cleans and merges training and test datasets for human activity recognition using Samsung Galaxy S smartphone datasets
## uses dpylr for generating groupbing means
########

library(dplyr)

## If the source data set changes, these constants will need to be updated to match the source data
constants <- list(
                    sourceZip="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                    subDir="UCI HAR Dataset",
                    featuresFile="features.txt",
                    labelsFile="activity_labels.txt",
                    trainFileX="train/X_train.txt",
                    trainFileY="train/Y_train.txt",
                    trainFileSubject="train/subject_train.txt",
                    testFileX="test/X_test.txt",
                    testFileY="test/Y_test.txt",
                    testFileSubject="test/subject_test.txt",
                    ##final output file parameters##
                    outputDataMeansFile="HumanActivityRecognitionData.txt",
                    outputColumnSeparator=","
                  )


## Step 1: Get data sets and unzip to target; verify existence
downloadData <- function(targetDirectory="Data", targetFile="SourceData.zip", forceDownload=FALSE, reExtract=FALSE) {
     
     ##set global path for merge function use
     g_Directory <<- paste(targetDirectory, constants[["subDir"]], sep="/")
     
     if(!dir.exists(targetDirectory)) {
          dir.create(targetDirectory)
     }   
     
     target <- paste(targetDirectory, targetFile, sep="/")
     
     if(forceDownload | !file.exists(target)){
          download.file(constants[["sourceZip"]], target)     
     }
     else {
          message("Source exists. Download skipped.")
     }
     
     if(reExtract | !dir.exists(g_Directory)) {
          unzip(target, exdir=targetDirectory)
     }
     else {
          message("Data set subdirectory exists. Unzip skipped.")
     }
     
}

## Step 2: Merges training and test data into single dataset based on matching regular expression for extraction
## Defaults to only mean and standard deviation measurements
mergeAndCleanData <- function(extractRegEx="mean\\(|std\\(") {
     
     message("Loading files...")
     
     allFeatures <- readSourceFile("featuresFile")
     filteredIndex <- grep(extractRegEx, allFeatures[,2])
     featureNames <- renameColumns(allFeatures[filteredIndex,2])
     
     labelSet <- readSourceFile("labelsFile")
     
     ## training data
     trainX <- readSourceFile("trainFileX")[filteredIndex]
     trainY <- readSourceFile("trainFileY")
     trainSubject <- readSourceFile("trainFileSubject")
     
     ## test data
     testX <- readSourceFile("testFileX")[filteredIndex]
     testY <- readSourceFile("testFileY")
     testSubject <- readSourceFile("testFileSubject")
     
     ## merge source data
     fullMerge <- rbind(
                         cbind(trainSubject, trainY, trainX), 
                         cbind(testSubject, testY, testX)
                    )
     
     ## link column names to dataset
     colnames(fullMerge) <- c("subject","activity",featureNames)
     
     ##set descriptive activity labels
     fullMerge$activity <- factor(fullMerge$activity, levels=labelSet[,1], labels=labelSet[,2])
     

     ##create data set with mean values for each subject/activity
     fullMergeMeans <- fullMerge %>% group_by(subject, activity) %>% summarise_each(funs(mean))
     
     write.table(fullMergeMeans, constants[["outputDataMeansFile"]], row.names = FALSE, quote = FALSE, sep=constants[["outputColumnSeparator"]])
     message(paste("Data set", constants[["outputDataMeansFile"]], "created."))
     
     rm(trainX,trainY,trainSubject,testX,testY,testSubject,fullMerge,fullMergeMeans)
     
}

## reduce repetition in read.table calls
readSourceFile <- function(constantRef) {
     
     read.table( file.path(g_Directory, constants[[constantRef]]) )
     
}

## Rename all measurements; modify as needed if extracting other options in mergeAndCleanData
renameColumns <- function(originalNames) {
     
     newNames <- gsub("Acc", "Accelerometer", originalNames)
     newNames <- gsub("Gyro", "Gyroscope", newNames)
     newNames <- gsub("Mag", "Magnitude", newNames)
     newNames <- gsub("^t", "Time", newNames)
     newNames <- gsub("^f", "Frequency", newNames)
     
     newNames <- gsub("-mean\\(\\)", "Mean", newNames)
     newNames <- gsub("-std\\(\\)", "StdDev", newNames)
     
     newNames <- gsub("-", "", newNames)
     newNames <- gsub("BodyBody", "Body", newNames)
     
     newNames
}








