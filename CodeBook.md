Getting and Cleaning Data Course Project - CodeBook

This Project is based on an R script "run_analysis.R", using the Source Data from an experiment with 
Wearable devices to track walking activity, and looks at the train, test data and its measures, extract the relevant measures
of interests and calculates a final average, resulting in the tidy_data.txt file (see the README.md file for further information).

Source Dataset for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Feature Selection of Source Dataset:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 
Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ)
 using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain
 Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional 
signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, 
fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean


Transformations (using "run_analysis.R" script) applied to the Source DataSet:

1) The training and test sets were merged to create one data set.
2) Only the measurements on the mean and standard deviation were extracted for each measurement, and the others were discarded.
3) The activity name or activity label was added for each activityID
4) Appropriately labels the data set with descriptive variable names: replacing Time Domain and Frequency Domain and other
abreviations to make a more meaningful variable name.
5) The final data set, tidy_data.txt, was created with the average of each variable for each activity and each subject.

Resulting Datasets: "tidy_data.txt" - data file resulting of running the "run_analysis.R" script

The first row of "tidy_data.txt" contains the names of the variables, listed below; the following rows contain the values of these variables.
Each row contains, for a given subject and activity, 79 averaged signal measurements.

SUBJECT
subjectId: integer, range 1-30 (identifier of the subject who carried out the experiment, total of 30 volunteers or subjects)

ACTIVITY
activityId: integer,range 1-6 
activityType: string, 6 possible values (label of the activity):
1 WALKING

2 WALKING_UPSTAIRS

3 WALKING_DOWNSTAIRS

4 SITTING

5 STANDING

6 LAYING


Variables "tidy_data.txt" file:
 [1] "activityId"                                                    
 [2] "activityType"                                                  
 [3] "subjectId"                                                     
 [4] "timeDomainBodyAccelerometerMeanX"                              
 [5] "timeDomainBodyAccelerometerMeanY"                              
 [6] "timeDomainBodyAccelerometerMeanZ"                              
 [7] "timeDomainBodyAccelerometerStandardDeviationX"                 
 [8] "timeDomainBodyAccelerometerStandardDeviationY"                 
 [9] "timeDomainBodyAccelerometerStandardDeviationZ"                 
[10] "timeDomainGravityAccelerometerMeanX"                           
[11] "timeDomainGravityAccelerometerMeanY"                           
[12] "timeDomainGravityAccelerometerMeanZ"                           
[13] "timeDomainGravityAccelerometerStandardDeviationX"              
[14] "timeDomainGravityAccelerometerStandardDeviationY"              
[15] "timeDomainGravityAccelerometerStandardDeviationZ"              
[16] "timeDomainBodyAccelerometerJerkMeanX"                          
[17] "timeDomainBodyAccelerometerJerkMeanY"                          
[18] "timeDomainBodyAccelerometerJerkMeanZ"                          
[19] "timeDomainBodyAccelerometerJerkStandardDeviationX"             
[20] "timeDomainBodyAccelerometerJerkStandardDeviationY"             
[21] "timeDomainBodyAccelerometerJerkStandardDeviationZ"             
[22] "timeDomainBodyGyroscopeMeanX"                                  
[23] "timeDomainBodyGyroscopeMeanY"                                  
[24] "timeDomainBodyGyroscopeMeanZ"                                  
[25] "timeDomainBodyGyroscopeStandardDeviationX"                     
[26] "timeDomainBodyGyroscopeStandardDeviationY"                     
[27] "timeDomainBodyGyroscopeStandardDeviationZ"                     
[28] "timeDomainBodyGyroscopeJerkMeanX"                              
[29] "timeDomainBodyGyroscopeJerkMeanY"                              
[30] "timeDomainBodyGyroscopeJerkMeanZ"                              
[31] "timeDomainBodyGyroscopeJerkStandardDeviationX"                 
[32] "timeDomainBodyGyroscopeJerkStandardDeviationY"                 
[33] "timeDomainBodyGyroscopeJerkStandardDeviationZ"                 
[34] "timeDomainBodyAccelerometerMagnitudeMean"                      
[35] "timeDomainBodyAccelerometerMagnitudeStandardDeviation"         
[36] "timeDomainGravityAccelerometerMagnitudeMean"                   
[37] "timeDomainGravityAccelerometerMagnitudeStandardDeviation"      
[38] "timeDomainBodyAccelerometerJerkMagnitudeMean"                  
[39] "timeDomainBodyAccelerometerJerkMagnitudeStandardDeviation"     
[40] "timeDomainBodyGyroscopeMagnitudeMean"                          
[41] "timeDomainBodyGyroscopeMagnitudeStandardDeviation"             
[42] "timeDomainBodyGyroscopeJerkMagnitudeMean"                      
[43] "timeDomainBodyGyroscopeJerkMagnitudeStandardDeviation"         
[44] "frequencyDomainBodyAccelerometerMeanX"                         
[45] "frequencyDomainBodyAccelerometerMeanY"                         
[46] "frequencyDomainBodyAccelerometerMeanZ"                         
[47] "frequencyDomainBodyAccelerometerStandardDeviationX"            
[48] "frequencyDomainBodyAccelerometerStandardDeviationY"            
[49] "frequencyDomainBodyAccelerometerStandardDeviationZ"            
[50] "frequencyDomainBodyAccelerometerMeanFrequencyX"                
[51] "frequencyDomainBodyAccelerometerMeanFrequencyY"                
[52] "frequencyDomainBodyAccelerometerMeanFrequencyZ"                
[53] "frequencyDomainBodyAccelerometerJerkMeanX"                     
[54] "frequencyDomainBodyAccelerometerJerkMeanY"                     
[55] "frequencyDomainBodyAccelerometerJerkMeanZ"                     
[56] "frequencyDomainBodyAccelerometerJerkStandardDeviationX"        
[57] "frequencyDomainBodyAccelerometerJerkStandardDeviationY"        
[58] "frequencyDomainBodyAccelerometerJerkStandardDeviationZ"        
[59] "frequencyDomainBodyAccelerometerJerkMeanFrequencyX"            
[60] "frequencyDomainBodyAccelerometerJerkMeanFrequencyY"            
[61] "frequencyDomainBodyAccelerometerJerkMeanFrequencyZ"            
[62] "frequencyDomainBodyGyroscopeMeanX"                             
[63] "frequencyDomainBodyGyroscopeMeanY"                             
[64] "frequencyDomainBodyGyroscopeMeanZ"                             
[65] "frequencyDomainBodyGyroscopeStandardDeviationX"                
[66] "frequencyDomainBodyGyroscopeStandardDeviationY"                
[67] "frequencyDomainBodyGyroscopeStandardDeviationZ"                
[68] "frequencyDomainBodyGyroscopeMeanFrequencyX"                    
[69] "frequencyDomainBodyGyroscopeMeanFrequencyY"                    
[70] "frequencyDomainBodyGyroscopeMeanFrequencyZ"                    
[71] "frequencyDomainBodyAccelerometerMagnitudeMean"                 
[72] "frequencyDomainBodyAccelerometerMagnitudeStandardDeviation"    
[73] "frequencyDomainBodyAccelerometerMagnitudeMeanFrequency"        
[74] "frequencyDomainBodyAccelerometerJerkMagnitudeMean"             
[75] "frequencyDomainBodyAccelerometerJerkMagnitudeStandardDeviation"
[76] "frequencyDomainBodyAccelerometerJerkMagnitudeMeanFrequency"    
[77] "frequencyDomainBodyGyroscopeMagnitudeMean"                     
[78] "frequencyDomainBodyGyroscopeMagnitudeStandardDeviation"        
[79] "frequencyDomainBodyGyroscopeMagnitudeMeanFrequency"            
[80] "frequencyDomainBodyGyroscopeJerkMagnitudeMean"                 
[81] "frequencyDomainBodyGyroscopeJerkMagnitudeStandardDeviation"    
[82] "frequencyDomainBodyGyroscopeJerkMagnitudeMeanFrequency" 

