#The data linked to from the course website represent data collected from the 
#accelerometers from the Samsung Galaxy S smartphone. A full description is 
#available at the site where the data was obtained:
     
#http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

#Here are the data for the project:

#download data
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
              "Dataset.zip", 
              method = "curl")

#unzip data
unzip("Dataset.zip")

########################load and preprocess the data############################
library(dplyr)                 #for tbl_df function
library(data.table)            #for setnames function
library(plyr)                  #for revalue function

preprocess<-function(x){
     #Read data
     
     s<-paste0("UCI HAR Dataset/",x,"/subject_",x,".txt") #subjects
     d<-paste0("UCI HAR Dataset/",x,"/X_",x,".txt")       #data
     c<-paste0("UCI HAR Dataset/",x,"/y_",x,".txt")       #activity codes
     
     subjects<-read.table(s)                              #read subjects
     subjects<-as.factor(subjects[,1])                    #convert to factor
     
     typeCode<-read.table(c)                              #read codes
     typeCode<-as.factor(typeCode[,1])                    #convert to factor
     
     data<-tbl_df(read.table(d))                          #read data
     
     #Add subjects and type Codes
     data<-cbind(subjects, typeCode, data)   #combines data into 1 table
     
     return(data)
}

#1. Merges the training and the test sets to create one data set.
test<-preprocess("test")        #collates data, subjects, activity for test
train<-preprocess("train")      #collates data, subjects, activity for train

all<-rbind(test, train)         #combines test and train datasets

#Read variable names (features)
features<-read.table("UCI HAR Dataset/features.txt",
                     sep="\t",               #separate by char that isn't there
                     #--> 1 column
                     strip.white=TRUE,       #delete whitespace
                     col.names='features')   #name the column

features<-features[[1]]                      #extract the vector from 1st col
features<-gsub(" ", "", features)            #find and delete spaces

#Rename variables to descriptive names by replaces colnames with features
all<-setnames(all, colnames(all), c("subjects","activity",features))  

#2. Extracts only the measurements on the mean and standard deviation for each 
#measurement.
meanCol<-select(all, contains("-mean()"))
stdCol<-select(all, contains("-std()"))

meanSTD<-cbind(all$subjects, all$activity, meanCol, stdCol)

#3. Uses descriptive activity names to name the activities in the data set
#read in activity labels

activity<-read.table("UCI HAR Dataset/activity_labels.txt", 
                     col.names=c("code", "activity"))

#convert table to named vector
actVec<-as.character(activity$activity)    
names(actVec)<-activity$code
 
actVec<-tolower(actVec)                    #make all lower case
actVec<-chartr("_", " ", actVec)           #remove non-alphanumeric characters

#revalue the test_label factor
meanSTD$"all$activity"<-revalue(meanSTD$"all$activity", actVec)

#4. Appropriately labels the data set with descriptive variable names.

names<-names(meanSTD)                      # convert names to a vector
names<-gsub("all\\$", "", names)           # fix names of subjects and activity
names<-gsub("[0-9]+", "", names)           # remove numbers from features
names<-gsub("\\(|\\)|-", "", names)        # remove non-alphanumeric chars
names<-tolower(names)                      # lowercase all

meanSTD<-setnames(meanSTD, names(meanSTD), names) #reset to formatted var names

#5. From the data set in step 4, creates a second, independent tidy data set 
#with the average of each variable for each activity and each subject.

tidy<-group_by(meanSTD, subjects, activity)
tidy<-summarize_each(tidy, "mean")

write.table(tidy, "tidy.txt", row.name=FALSE)
