run_analysis <- function() {
        ## read data from test set and training set
        ## merge test and training set
        ## extract only mean and standard deviation
        ## use descriptive activity names
        ## label variable names
        
        ## read test set
        test <- read.table("./UCI HAR Dataset/test/X_test.txt")
        

        ## read training set
        train <- read.table("./UCI HAR Dataset/train/X_train.txt")

        ## read variable names
        name <- read.table("./UCI HAR Dataset/features.txt")

        ## assign variable names to test and training set
        colnames(test) <- as.character(name$V2)
        colnames(train) <- as.character(name$V2)

        ## read subjects and labels
        testsub <- read.table(file = "./UCI HAR Dataset/test/subject_test.txt")
        testlabel <- read.table(file = "./UCI HAR Dataset/test/y_test.txt")
        trainsub <- read.table(file = "./UCI HAR Dataset/train/subject_train.txt")
        trainlabel <- read.table(file = "./UCI HAR Dataset/train/y_train.txt")

        
        ## add subject and label columns into 
        ## test and training set
        colnames(testsub) <- "subject"
        colnames(trainsub) <- "subject"
        colnames(testlabel) <- "label"
        colnames(trainlabel) <- "label"
        testsl <- cbind(testlabel, testsub, test)
        trainsl <- cbind(trainlabel, trainsub, train)

        ## merge test and training sets
        Data <- rbind(testsl, trainsl)

        ## extract mean and std measurements
        datamean <- Data[, grep("mean\\(", names(Data),value = TRUE)]
        datastd <- Data[, grep("std", names(Data), value = TRUE)]
        dataext <- cbind(Data$label, Data$subject, datamean, datastd)
        colnames(dataext)[1] <- "label"
        colnames(dataext)[2] <- "subject"

      dataext
}
