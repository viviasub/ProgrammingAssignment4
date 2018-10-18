rm(list = ls())

library(dplyr)

## SET working dir 
work_dir<-"~/Progetti_R/progetti_r_new/script_vecchi_tutorial/ProgrammingAssignment4"
if(!file.exists(work_dir)){dir.create(work_dir)}
setwd("~/Progetti_R/progetti_r_new/script_vecchi_tutorial/ProgrammingAssignment4")
if(!file.exists("data")){dir.create("data")}
setwd("./data")

## GET DATA

url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
file_name<-"Dataset.zip"
if(!file.exists(file_name)){download.file(url, destfile = file_name)}
list.files()
unzip(file_name)


## READ DATA

rm(list = ls())
#activity_labels <- read_table2("UCI HAR Dataset/activity_labels.txt",col_names = FALSE)
#features <- read_table2("UCI HAR Dataset/features.txt", col_names = FALSE)
#X_train <- read_table2("UCI HAR Dataset/train/X_train.txt", col_names = FALSE)
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
colnames(activity_labels)<-c("activityID","label")

features <- read.table("UCI HAR Dataset/features.txt",as.is=TRUE) #keep label as text 
class(features[,2])

train_Subj<-read.table("UCI HAR Dataset/train/subject_train.txt")
train_Data<-read.table("UCI HAR Dataset/train/X_train.txt")
train_Activity<-read.table("UCI HAR Dataset/train/y_train.txt")


test_Subj<-read.table("UCI HAR Dataset/test/subject_test.txt")
test_Data<-read.table("UCI HAR Dataset/test/X_test.txt")
test_Activity<-read.table("UCI HAR Dataset/test/y_test.txt")


################################
## 1 MERGES training and test ##
################################

subject<-rbind(train_Subj,test_Subj)
colnames(subject)<-"subject"
rm(train_Subj,test_Subj)

activity<-rbind(train_Activity,test_Activity)
colnames(activity)<-"activity"
rm(train_Activity,test_Activity)

data<-rbind(train_Data,test_Data)
rm(train_Data,test_Data)

total<-cbind(subject,activity,data)
colnames(total)<-c("subject","activity",features[,2])
rm(subject,activity,data,features)


################################
## 2 EXTRACT mean() and std() ##
################################

columns<-grepl("subject|activity|mean|std",colnames(total))
data_set<-total[,columns]
columns<-grepl("meanFreq",colnames(data_set))
data_set<-data_set[,!columns]

rm(total,columns)


#######################################
## 3 REPLACE activity code with name ##
#######################################

data_set$activity<-factor(data_set$activity, levels = activity_labels[,1],activity_labels[,2])
data_set$activity<-tolower(data_set$activity)
data_set$activity<-gsub("ing","",data_set$activity)
data_set$activity<-gsub("walk_","",data_set$activity)
head(data_set[1:8],3)


#############################
## 4 REPLACE variable name ##
#############################

col_name_new<-colnames(data_set)
col_name_new<-gsub("^t","Time_",col_name_new)
col_name_new<-gsub("^f","Freq_",col_name_new)
col_name_new<-gsub("Body","",col_name_new)
col_name_new<-gsub("BodyBody","",col_name_new)
col_name_new<-gsub("[\\(\\)]","",col_name_new)
col_name_new<-gsub("[\\-]","_",col_name_new)
colnames(data_set)<-col_name_new
head(data_set[1:8],3)


#######################################################################
## 5 TIDY DATA by subject and activity with average of each variable ##
#######################################################################

data_set_mean<-data_set %>% group_by(subject,activity) %>% summarise_all(mean)
head(data_set_mean)
setwd("./..")
getwd()
write.table(data_set_mean,"tidy_data.txt",row.name=FALSE)


