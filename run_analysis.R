## COURSERA GETTING AND CLEANING DATA - COURSE PROJECT

# Set Working Directory
setwd("C:/Users/silvi/Desktop/Coursera/Clean_Data")

# Unzip dataSet to specified directory
unzip("./getdata_projectfiles_UCI HAR Dataset.zip")

# checking unzipped folder content:
list.files("UCI HAR Dataset")

# checking content of "test" folder within main Dataset folder
list.files("./UCI HAR Dataset/test", recursive = TRUE)

# checking content of "train" folder within main Dataset folder
list.files("./UCI HAR Dataset/train", recursive =  TRUE)

#create an output with all the filenames
all_files = list.files("UCI HAR Dataset", recursive=TRUE)
#show the filenames
all_files
# 28 files total - we have now listed all the Dataset to be analysed

# README document within the unzipped Dataset folder contains a detailed description of
#the data; please refer to this for further understanding; extract from the document:
# For each record it is provided:
#  ======================================
#- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
#- Triaxial Angular velocity from the gyroscope. 
#- A 561-feature vector with time and frequency domain variables. 
#- Its activity label. 
#- An identifier of the subject who carried out the experiment.
#  ======================================

### IDENTIFYING RELEVANT FILES FOR THE ANALYSIS ###
## As per assignment description, we'll need to look at the test and training data,
## the activities performed by each individual and their measures or features.
## Therefore, relevant files to export are:

# 'test/X_test.txt': Test set. - 30% population volunteered for this experiment
# 'test/y_test.txt': Test labels.
# 'train/X_train.txt': Training set. - 70% population volunteered for this experiment
# 'train/y_train.txt': Training labels.

# 'features.txt': List of all features.
# 'activity_labels.txt': Links the class labels with their activity name.
# 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 


#### Reading training set: xtrain / ytrain, subject train
xtrain = read.table(file.path("./UCI HAR Dataset", "train", "X_train.txt"),header = FALSE)
ytrain = read.table(file.path("./UCI HAR Dataset", "train", "y_train.txt"),header = FALSE)
subject_train = read.table(file.path("./UCI HAR Dataset", "train", "subject_train.txt"),header = FALSE)
#Reading testing set: xtest / ytest, subject test
xtest = read.table(file.path("./UCI HAR Dataset", "test", "X_test.txt"),header = FALSE)
ytest = read.table(file.path("./UCI HAR Dataset", "test", "y_test.txt"),header = FALSE)
subject_test = read.table(file.path("./UCI HAR Dataset", "test", "subject_test.txt"),header = FALSE)
#Reading features info
features = read.table(file.path("./UCI HAR Dataset", "features.txt"),header = FALSE)
#Reading activity info
activityLabels = read.table(file.path("./UCI HAR Dataset", "activity_labels.txt"),header = FALSE)

#checking the files imported into R:
head(xtrain)
head(ytrain)
head(xtest)
head(ytest)
head(subject_train)
head(subject_test)
head(activityLabels)
head(features)

# column names are missing for both training and testing sets, so let's add these:
# 'features' file can be used here for adding the measurement column names needed to train and test sets:
colnames(xtrain) = features[,2]
colnames(ytrain) = "activityId"
colnames(subject_train) = "subjectId"
colnames(xtest) = features[,2]
colnames(ytest) = "activityId"
colnames(subject_test) = "subjectId"
colnames(activityLabels) <- c('activityId','activityType')

#checking the files again:
head(xtrain)
head(ytrain)
head(xtest)
head(ytest)
head(subject_train)
head(subject_test)
head(activityLabels)
head(features)

# Requirement 1) Assignment: Merging the training and the test sets to create one dataset:
#
# Merging train and test data:
mrg_train = cbind(ytrain, subject_train, xtrain)
mrg_test = cbind(ytest, subject_test, xtest)
# Merging both above:
train_test = rbind(mrg_train, mrg_test)

# Requirement 2) Assignment: Extracts only the measurements on the mean and standard deviation for each measurement.
# There are various mean and standard deviation measurements, so it's worth using the
# grepl function (to look for 'mean' and 'std' substrings within the columnames) to grab those:

# 1) put all the column names from the dataset together:
all_cols = colnames(train_test)
# 2) grab all mean and std measurements, along with activity and subject Ids:
mean_std = (grepl("activityId" , all_cols) | grepl("subjectId" , all_cols) | grepl("mean" , all_cols) | grepl("std" , all_cols))
# 3) create a final subset with the required mean and std columns only:
train_test_mean_std = train_test[ , mean_std == TRUE]
# check: 
colnames(train_test_mean_std)

# Requirement 3) Assignment: Uses descriptive activity names to name the activities in the data set
# merge the dataset created in previous step with Activity Names:
#ActivityNames = merge(train_test_mean_std, activityLabels, by='activityId', all.x=TRUE)
ActivityNames = merge(activityLabels,train_test_mean_std,  by='activityId', all.x=TRUE)
# check:
head(ActivityNames)
# activityType has been added as final column


# Requirement 4) Assignment - Appropriately labels the data set with descriptive variable names.
# Will use 'gsub' function for pattern matching and substitution:
?gsub

# get column names
ActivityNamesCols <- colnames(ActivityNames)

# remove special characters
ActivityNamesCols <- gsub("[\\(\\)-]", "", ActivityNamesCols)

# replace abbreviations
ActivityNamesCols <- gsub("^f", "frequencyDomain", ActivityNamesCols)
ActivityNamesCols <- gsub("^t", "timeDomain", ActivityNamesCols)
ActivityNamesCols <- gsub("Acc", "Accelerometer", ActivityNamesCols)
ActivityNamesCols <- gsub("Gyro", "Gyroscope", ActivityNamesCols)
ActivityNamesCols <- gsub("Mag", "Magnitude", ActivityNamesCols)
ActivityNamesCols <- gsub("Freq", "Frequency", ActivityNamesCols)
ActivityNamesCols <- gsub("mean", "Mean", ActivityNamesCols)
ActivityNamesCols <- gsub("std", "StandardDeviation", ActivityNamesCols)
# replace "BodyBody" with "Body"
ActivityNamesCols <- gsub("BodyBody", "Body", ActivityNamesCols)

# use new labels as column names
colnames(ActivityNames) <- ActivityNamesCols


# Requirement 5) Assignment: Creates a independent tidy data set with the average of each variable for each activity and each subject

# We'll need to look at the average (or mean) of each variable for each activity first.
# The aggregate function will help grouping the data calculating the average:
#check function:
?aggregate 

# Grouping and Ordering Calculated Averages:
avge_ActivityNames <- aggregate(. ~subjectId + activityId +activityType, data=ActivityNames, mean)

#Write the required ouput to a text file:
write.table(avge_ActivityNames, "tidy_data.txt", row.name=FALSE)

