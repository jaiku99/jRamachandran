
## Script to  read the Smart phone human Activity data and Create a Tidy Data Set #/
  
# Section  1 : Reading the available Data into Tables  #/
  
# Initial Routines  #/
setwd( "./Coursera")
library(data.table)
library(dplyr)
library(reshape2)

# Dowloading the data from the Web site  #/

if (!file.exists("data"))  {
     dir.create("data")
     }

FUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file( FUrl, destfile= "./data/Dataset.zip" )


# Read data from the unzipped files into tables in memory #/

  setwd( "./data/Dataset/UCI HAR Dataset")
  
       # XTest - Test data set #/
  Xtest <- read.table("./test/X_test.txt", header = FALSE, sep ="", quote="")   

       # YTest - Test label set #/ 
  Ytest <- read.table("./test/y_test.txt", header = FALSE, sep ="", quote="")

       #  Test Subjects  #/
  subject_test <- read.table("./test/subject_test.txt", header = FALSE, sep ="", quote="")


       # XTrain - Train data set #/
  Xtrain <- read.table("./train/X_train.txt", header = FALSE, sep ="", quote="")   

       # yTrain - Training label set #/ 
  Ytrain <- read.table("./train/y_train.txt", header = FALSE, sep ="", quote="")

      #  Training  Subjects  #/
  subject_train <- read.table("./train/subject_train.txt", header = FALSE, sep ="", quote="")

      #  Features  list  :To be used as column names        #/ 
  features  <- read.table("./features.txt", header = FALSE, sep ="", quote="")

     #  Activity lables #/
  act_lables <- read.table("./activity_labels.txt", header = FALSE, sep ="", quote="") 
  setnames(act_lables, c("Test", "Names"))


# Combining Tables to create required Data Set #/

    Test_data <- cbind(subject_test, Ytest, Xtest)

    Train_data <- cbind(subject_train, Ytrain, Xtrain)

    Combo_data <- rbind( Test_data, Train_data )

    # Preparing Column names to be added to the data table #/
     colnames <- c("Subject", "Test", as.character(features[,2]))

    # Add Cloumn Names  #/ 
     setnames( Combo_data, colnames)

     DCombo_data  <-  data.table(Combo_data)

#  Separate and rearraing the coulumns so that we get required columns with Mean and STD #/
#  - and drop the rest  #/
#  Using the  dplyr package funtions to select and drop columns 



     # Saving the 'Subject'  and 'Test'  Columns #/
     DKeys <- DCombo_data %>%select( 1:2) %>%
                             mutate(ActDesc = act_lables$Names[Test]) %>%
                             select( -Test)


     # Extracting columns that represent Mean values  only  #/
     DMean <- select(DCombo_data, contains("mean"))
  
     # Extracting columns that represent STD values only #/
     DStd  <- select(DCombo_data, contains("std"))

     # Combining the three to  get the data table we need #/
     DCombo  <-   cbind(DKeys, DMean, DStd )
    
#  Step 4 Complete #/
  
  
# Step 5  Tidying up the data #/
     
  #  Summarizing and grouping data as needed   #/
  # Making a list of column variable names  #
  TCols <- colnames(DCombo)
  ColNum  <-      nrow(data.frame(TCols)) - 2
  TCol <- c(TCols[3:ColNum])

  # Creating a Tidy Narrow Data set of all individual observations #/ 
  DNarrow  <-  melt(DCombo, id=c("Subject", "ActDesc"), measure.vars=TCol)

  #  Summarizing and grouping data as needed   #/

     DSubject_mean  <- dcast(DNarrow, Subject ~ variable, mean)

     DActivity_mean  <- dcast(DNarrow, ActDesc ~ variable, mean)


setwd("../..")

write.table(DNarrow,  file= "NarrowData.txt",  col.names =TRUE )

write.table(DSubject_mean,  file= "SubMean.txt",  col.names =TRUE )

write.table(DActivity_mean,  file= "ActMean.txt",  col.names =TRUE )


#Clean up #/



