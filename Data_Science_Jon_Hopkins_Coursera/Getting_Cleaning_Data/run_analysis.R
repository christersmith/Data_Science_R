if(!file.exists("C:/run_analysis")){dir.create("C:/run_analysis")}
setwd("C:/run_analysis")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="C:/run_analysis/Dataset.zip")

unzip(zipfile="C:/run_analysis/Dataset.zip",exdir="C:/run_analysis")
filepath <- file.path("C:/run_analysis","UCI HAR Dataset")
the_files<-list.files(filepath, recursive=TRUE)
the_files

#Per the read.me in the zipped file, test and train files are:
#test/ subject_test.txt, X_test.txt, y_test.txt,
#train/ subject_train.txt, X_train.txt, y_train.txt
##1) Merge the training and test sets to create one data set

#load the datasets
x_train <- read.table("C:/run_analysis/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("C:/run_analysis/UCI HAR Dataset/train/y_train.txt")
x_test <- read.table("C:/run_analysis/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("C:/run_analysis/UCI HAR Dataset/test/y_test.txt")
subject_train <- read.table("C:/run_analysis/UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("C:/run_analysis/UCI HAR Dataset/test/subject_test.txt")
features <- read.table("C:/run_analysis/UCI HAR Dataset/features.txt")

#create a combined 'x' data set of train and test
x_comb <- rbind(x_train, x_test)

#create a combined 'y' data set of train and test
y_comb <- rbind(y_train, y_test)

#create a combined 'subject' data set of train and test
subject_comb <- rbind(subject_train, subject_test)

##2) Extract only the measurements on the mean and standard deviation for each measurement

#retrieve only columns with mean() or std() in their names
meannstd_features <- grep("(mean|std)\\(\\)", features[, 2])

#subset the desired columns
x_comb <- x_comb[, meannstd_features]

#correct the column names
names(x_comb) <- features[meannstd_features, 2]

##3) Use descriptive activity names to name the activities in the data set

activities <- read.table("C:/run_analysis/UCI HAR Dataset/activity_labels.txt")

#update values with correct activity names
y_comb[, 1] <- activities[y_comb[, 1], 2]

#correct column name
names(y_comb) <- "Activity"

##4) Appropriately label the data set with descriptive variable names

#correct column name
names(subject_comb) <- "Subject"

# bind all the data in a single data set
xysubject_combined <- cbind(x_comb, y_comb, subject_comb)
str(xysubject_combined)

#Appropriately labeling...(renaming)
names(xysubject_combined)<-gsub("^t","Time", names(xysubject_combined))
names(xysubject_combined)<-gsub("^f","Frequency", names(xysubject_combined))
names(xysubject_combined)<-gsub("Acc","Acceleromater", names(xysubject_combined))
names(xysubject_combined)<-gsub("Gyro","Gyroscope", names(xysubject_combined))
names(xysubject_combined)<-gsub("Mag","Magnitude", names(xysubject_combined))
names(xysubject_combined)<-gsub("BodyBody","Body", names(xysubject_combined))
names(xysubject_combined)

##5)Create a second, independent tidy data set with the 
#average of each variable for each activity and each subject

library(plyr)
# columns 1:66 have their averages taken
#columns 67 and 68 are character columns, activity & subject
run_analysis <- ddply(xysubject_combined, .(Subject, Activity), function(x) colMeans(x[, 1:66]))

write.table(run_analysis, "run_analysis.txt", row.name=FALSE)
