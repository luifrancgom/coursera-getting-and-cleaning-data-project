# Loading libraries
library(tidyverse)

# Get data ----

data_dir <- "data"
data_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if (!file.exists(data_dir)) {
  dir.create(path = data_dir) 
}

if (!file.exists("data/data.zip")) {
download.file(url = data_url, 
              destfile = "data/data.zip")
}


if (!file.exists("data/UCI HAR Dataset")) {
unzip(zipfile = "data/data.zip", 
      exdir = "data")
}

# Merges the training and the test sets to create one data set ----

## Obtain labels
activites <- read.table(file = "data/UCI HAR Dataset/activity_labels.txt", col.names = c("activity_id", "activity")) %>% 
  as_tibble()
features <- read.table("data/UCI HAR Dataset/features.txt", 
                       col.names = c("feature_id", "feature")) %>% 
  as_tibble()

## Obtain data
y_train <- read.table(file = "data/UCI HAR Dataset/train/y_train.txt", 
                      col.names = "activity")
x_train <- read.table(file = "data/UCI HAR Dataset/train/X_train.txt") %>% 
  as_tibble()
subject_train <- read.table(file = "data/UCI HAR Dataset/train/subject_train.txt", 
                            col.names = "subject") %>% 
  as_tibble()

y_test <- read.table(file = "data/UCI HAR Dataset/test/y_test.txt", 
                     col.names = "activity") %>% 
  as_tibble()
x_test <- read.table(file = "data/UCI HAR Dataset/test/X_test.txt") %>% 
  as_tibble()
subject_test <- read.table(file = "data/UCI HAR Dataset/test/subject_test.txt", 
                           col.names = "subject") %>% 
  as_tibble()


 ## Rename columns to match feature names
x_test <- x_test %>% 
  set_names(nm = features %>% pull(feature))

x_train <- x_train %>% 
  set_names(nm = features %>% pull(feature))

## Merge
train <- bind_cols(subject_train, y_train, x_train)
test <- bind_cols(subject_test, y_test, x_test)
merge_data <- bind_rows(train, test)

# Extracts only the measurements on the mean and standard deviation for each measurement ----
merge_data <- merge_data %>% 
  select(subject, activity, contains("mean") | contains("std"))

# Uses descriptive activity names to name the activities in the data set ----
merge_data <- merge_data %>%
  mutate(activity = case_when(
    activity == 1 ~ "WALKING",
    activity == 2 ~ "WALKING_UPSTAIRS",
    activity == 3 ~ "WALKING_DOWNSTAIRS",
    activity == 4 ~ "SITTING",
    activity == 5 ~ "STANDING",
    activity == 6 ~ "LAYING",
    TRUE ~ NA_character_
  ))

# Appropriately labels the data set with descriptive variable names ----
names(merge_data) <- str_replace_all(string = names(merge_data),
                                     pattern = "-mean",
                                     replacement = "_mean")
names(merge_data) <- str_replace_all(string = names(merge_data),
                                     pattern = "-std",
                                     replacement = "_std")
names(merge_data) <- str_replace_all(string = names(merge_data),
                                     pattern = "Acc",
                                     replacement = "_accelerometer")
names(merge_data) <- str_replace_all(string = names(merge_data),
                                     pattern = "Gyro",
                                     replacement = "_gyroscope")
names(merge_data) <- str_replace_all(string = names(merge_data),
                                     pattern = "BodyBody",
                                     replacement = "Body")
names(merge_data) <- str_replace_all(string = names(merge_data),
                                     pattern = "^t", 
                                     replacement = "time")
names(merge_data) <- str_replace_all(string = names(merge_data), 
                                     pattern =  "^f", 
                                     replacement = "frequency")

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject ----
tidy_data <- merge_data %>% 
  group_by(activity, subject) %>% 
  summarize(across(.cols = everything(), .fns = mean))

# Save data sets
write.table(x = merge_data, 
            file = "tidy_data.txt", 
            quote = FALSE)