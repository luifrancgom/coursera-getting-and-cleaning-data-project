# Data

The data was obtained [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and can be downloaded [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) in a zip format. The data is related to human activity recognition using smartphones.

# Data processing

1. Merges the training and the test sets to create one data set

The labels and data were obtained using base R and functions from the `tidyverse`. The columns were renamed to match the feature names. Then the data was merged first by columns and then by rows to finally be called `merge_data` 

2. Extract only the measurements on the mean and standard deviation for each measurement

The labels with the words mean and std were extracted using functions from the `dplyr` package that belongs to the `tidyverse` and `merge_data` was updated with the new subset of names.

3. Uses descriptive activity names to name the activities in the data set

Using functions from the `dplyr` package that belongs to the `tidyverse` and the file `activity_labels.txt`, the activities were named using descriptive activity names.

4. Appropriately labels the data set with descriptive variable names

Using functions from the `stringr` package that belongs to the `tidyverse` the labels were modified to use descriptive variable names.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

Using functions from the `dplyr` package that belongs to the `tidyverse`, a tidy data set with the average of each variable for each activity and each subject were calculated and saved.

# Variables in `tidy_data.txt`

## IDs

- subject: subject number (1-30)
- activity: type of activity (laying, sitting, standing, walking, walking downstairs, walking upstairs) 

## Features

- All the variables correspond to the mean by subject and activity:

    + timeBody_accelerometer_mean...X
    + timeBody_accelerometer_mean...Y
    + timeBody_accelerometer_mean...Z
    + timeGravity_accelerometer_mean...X
    + timeGravity_accelerometer_mean...Y
    + timeGravity_accelerometer_mean...Z
    + timeBody_accelerometerJerk_mean...X
    + timeBody_accelerometerJerk_mean...Y
    + timeBody_accelerometerJerk_mean...Z
    + timeBody_gyroscope_mean...X
    + timeBody_gyroscope_mean...Y
    + timeBody_gyroscope_mean...Z 
    + timeBody_gyroscopeJerk_mean...X
    + timeBody_gyroscopeJerk_mean...Y
    + timeBody_gyroscopeJerk_mean...Z 
    + timeBody_accelerometerMag_mean..
    + timeGravity_accelerometerMag_mean..
    + timeBody_accelerometerJerkMag_mean..
    + timeBody_gyroscopeMag_mean.."
    + timeBody_gyroscopeJerkMag_mean..
    + frequencyBody_accelerometer_mean...X
    + frequencyBody_accelerometer_mean...Y
    + frequencyBody_accelerometer_mean...Z"
    + frequencyBody_accelerometer_meanFreq...X
    + frequencyBody_accelerometer_meanFreq...Y
    + frequencyBody_accelerometer_meanFreq...Z
    + frequencyBody_accelerometerJerk_mean...X
    + frequencyBody_accelerometerJerk_mean...Y
    + frequencyBody_accelerometerJerk_mean...Z
    + frequencyBody_accelerometerJerk_meanFreq...X
    + frequencyBody_accelerometerJerk_meanFreq...Y
    + frequencyBody_accelerometerJerk_meanFreq...Z
    + frequencyBody_gyroscope_mean...X
    + frequencyBody_gyroscope_mean...Y
    + frequencyBody_gyroscope_mean...Z
    + frequencyBody_gyroscope_meanFreq...X
    + frequencyBody_gyroscope_meanFreq...Y 
    + frequencyBody_gyroscope_meanFreq...Z
    + frequencyBody_accelerometerMag_mean..
    + frequencyBody_accelerometerMag_meanFreq..
    + frequencyBody_accelerometerJerkMag_mean..
    + frequencyBody_accelerometerJerkMag_meanFreq.."
    + frequencyBody_gyroscopeMag_mean.."
    + frequencyBody_gyroscopeMag_meanFreq..
    + frequencyBody_gyroscopeJerkMag_mean..
    + frequencyBody_gyroscopeJerkMag_meanFreq..
    + angle.tBody_accelerometerMean.gravity.
    + angle.tBody_accelerometerJerkMean..gravityMean.
    + angle.tBody_gyroscopeMean.gravityMean.
    + angle.tBody_gyroscopeJerkMean.gravityMean.
    + angle.X.gravityMean.
    + angle.Y.gravityMean.
    + angle.Z.gravityMean.
    + timeBody_accelerometer_std...X
    + timeBody_accelerometer_std...Y
    + timeBody_accelerometer_std...Z
    + timeGravity_accelerometer_std...X
    + timeGravity_accelerometer_std...Y
    + timeGravity_accelerometer_std...Z
    + timeBody_accelerometerJerk_std...X
    timeBody_accelerometerJerk_std...Y
    + timeBody_accelerometerJerk_std...Z
    + timeBody_gyroscope_std...X
    + timeBody_gyroscope_std...Y
    + timeBody_gyroscope_std...Z
    + timeBody_gyroscopeJerk_std...X
    + timeBody_gyroscopeJerk_std...Y
    + timeBody_gyroscopeJerk_std...Z
    + timeBody_accelerometerMag_std..
    + timeGravity_accelerometerMag_std..
    + timeBody_accelerometerJerkMag_std..
    + timeBody_gyroscopeMag_std..
    + timeBody_gyroscopeJerkMag_std..
    + frequencyBody_accelerometer_std...X 
    + frequencyBody_accelerometer_std...Y
    + frequencyBody_accelerometer_std...Z 
    + frequencyBody_accelerometerJerk_std...X
    + frequencyBody_accelerometerJerk_std...Y
    + frequencyBody_accelerometerJerk_std...Z
    + frequencyBody_gyroscope_std...X 
    + frequencyBody_gyroscope_std...Y 
    + frequencyBody_gyroscope_std...Z 
    + frequencyBody_accelerometerMag_std.."
    + frequencyBody_accelerometerJerkMag_std.."
    + frequencyBody_gyroscopeMag_std.." 
    + frequencyBody_gyroscopeJerkMag_std.." 
