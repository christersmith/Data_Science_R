#Introduction
The script **run_analysis**.R fulfills the 5 steps described in the course project's definition.

_**You should create one R script called run-analysis.R that does the following.**_ 

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names. 

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Source Data

A full description of the data used in this project can be found at The _UCI Machine Learning Repository_

#Variables
**X-train**, **y-train**, **X-test**, **y-test**, **subject-train** and **subject-test** contain the data from the downloaded files.
**x-comb**, **y-comb** and **subject_comb** merge the previous (similar) datasets to further analysis.
**features** contains the correct names for the _x-comb_ dataset, which are applied to the column names stored in meannstd-features, a numeric vector used to extract the desired data.
A similar approach is taken with activity names through the activities variable and on _y-comb_.
**xysubject-combined** merges _x-comb_, _y-comb_ and _subject-comb_ in a big dataset.

#Further defining the variables

###Identifiers
Subject - The ID of the test subject

Activity - The type of activity performed when the corresponding measurements were taken

###Measurement Names
[1] "TimeBodyAcceleromater-mean()-X"                
 [2] "TimeBodyAcceleromater-mean()-Y"                
 [3] "TimeBodyAcceleromater-mean()-Z"                
 [4] "TimeBodyAcceleromater-std()-X"                 
 [5] "TimeBodyAcceleromater-std()-Y"                 
 [6] "TimeBodyAcceleromater-std()-Z"                 
 [7] "TimeGravityAcceleromater-mean()-X"             
 [8] "TimeGravityAcceleromater-mean()-Y"             
 [9] "TimeGravityAcceleromater-mean()-Z"             
[10] "TimeGravityAcceleromater-std()-X"              
[11] "TimeGravityAcceleromater-std()-Y"              
[12] "TimeGravityAcceleromater-std()-Z"              
[13] "TimeBodyAcceleromaterJerk-mean()-X"            
[14] "TimeBodyAcceleromaterJerk-mean()-Y"            
[15] "TimeBodyAcceleromaterJerk-mean()-Z"            
[16] "TimeBodyAcceleromaterJerk-std()-X"             
[17] "TimeBodyAcceleromaterJerk-std()-Y"             
[18] "TimeBodyAcceleromaterJerk-std()-Z"             
[19] "TimeBodyGyroscope-mean()-X"                    
[20] "TimeBodyGyroscope-mean()-Y"                    
[21] "TimeBodyGyroscope-mean()-Z"                    
[22] "TimeBodyGyroscope-std()-X"                     
[23] "TimeBodyGyroscope-std()-Y"                     
[24] "TimeBodyGyroscope-std()-Z"                     
[25] "TimeBodyGyroscopeJerk-mean()-X"                
[26] "TimeBodyGyroscopeJerk-mean()-Y"                
[27] "TimeBodyGyroscopeJerk-mean()-Z"                
[28] "TimeBodyGyroscopeJerk-std()-X"                 
[29] "TimeBodyGyroscopeJerk-std()-Y"                 
[30] "TimeBodyGyroscopeJerk-std()-Z"                 
[31] "TimeBodyAcceleromaterMagnitude-mean()"         
[32] "TimeBodyAcceleromaterMagnitude-std()"          
[33] "TimeGravityAcceleromaterMagnitude-mean()"      
[34] "TimeGravityAcceleromaterMagnitude-std()"       
[35] "TimeBodyAcceleromaterJerkMagnitude-mean()"     
[36] "TimeBodyAcceleromaterJerkMagnitude-std()"      
[37] "TimeBodyGyroscopeMagnitude-mean()"             
[38] "TimeBodyGyroscopeMagnitude-std()"              
[39] "TimeBodyGyroscopeJerkMagnitude-mean()"         
[40] "TimeBodyGyroscopeJerkMagnitude-std()"          
[41] "FrequencyBodyAcceleromater-mean()-X"           
[42] "FrequencyBodyAcceleromater-mean()-Y"           
[43] "FrequencyBodyAcceleromater-mean()-Z"           
[44] "FrequencyBodyAcceleromater-std()-X"            
[45] "FrequencyBodyAcceleromater-std()-Y"            
[46] "FrequencyBodyAcceleromater-std()-Z"            
[47] "FrequencyBodyAcceleromaterJerk-mean()-X"       
[48] "FrequencyBodyAcceleromaterJerk-mean()-Y"       
[49] "FrequencyBodyAcceleromaterJerk-mean()-Z"       
[50] "FrequencyBodyAcceleromaterJerk-std()-X"        
[51] "FrequencyBodyAcceleromaterJerk-std()-Y"        
[52] "FrequencyBodyAcceleromaterJerk-std()-Z"        
[53] "FrequencyBodyGyroscope-mean()-X"               
[54] "FrequencyBodyGyroscope-mean()-Y"               
[55] "FrequencyBodyGyroscope-mean()-Z"               
[56] "FrequencyBodyGyroscope-std()-X"                
[57] "FrequencyBodyGyroscope-std()-Y"                
[58] "FrequencyBodyGyroscope-std()-Z"                
[59] "FrequencyBodyAcceleromaterMagnitude-mean()"    
[60] "FrequencyBodyAcceleromaterMagnitude-std()"     
[61] "FrequencyBodyAcceleromaterJerkMagnitude-mean()"

[62] "FrequencyBodyAcceleromaterJerkMagnitude-std()" 

[63] "FrequencyBodyGyroscopeMagnitude-mean()"          
[64] "FrequencyBodyGyroscopeMagnitude-std()"         
[65] "FrequencyBodyGyroscopeJerkMagnitude-mean()"    
[66] "FrequencyBodyGyroscopeJerkMagnitude-std()"

###Activity Labels
WALKING: subject was walking during the test

WALKING_UPSTAIRS: subject was walking up a staircase during the test

WALKING_DOWNSTAIRS: subject was walking down a staircase during the test

SITTING: subject was sitting during the test

STANDING: subject was standing during the test

LAYING: subject was laying down during the test

#Process 

###0) 
Read the README included with the file, to see which files you are going to be working with: 

_test/ subject-test.txt, X-test.txt, y-test.txt,_

_train/ subject-train.txt, X-train.txt, y-train.txt_

###1) 
Import file

###2)

Per Q1, merge the data by first loading all the data sets (including features) and merging all similar data sets using the rbind() function (for x, y, and subject).

###3)

Per Q2, we grab only those columns with _mean()_ or _std()_ in them. We then subset them into their own data set and rename the column names from the table _features_ that we had earlier imported.

###4)

Per Q3, we import the activity-labels data table. Since the activity data is addressed with values 1:6, we take the activity names and IDs from the imported activity-labels data set and they are substituted into the y dataset.

###5)

We rename the _Subject_ column to Subject, , then bind our x, y, and subject table columns (mean and std) altogether.

###6)

Per Q4, We notice the column names are kind of hard to understand what they actually are, so we rename them. 

"t" to "Time"
"f" to "Frequency"
"Acc" to "Acceleromater"
"Gyro" to "Gyroscope"
"Mag" to "Magnitude"
"BodyBody" to "Body"

Now they look better.

###7)

Per Q5, we generate a new dataset with all the average measures for each subject and activity type. The output file is called run_analysis.txt, and is found in this repository.