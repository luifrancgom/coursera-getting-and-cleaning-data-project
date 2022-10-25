# Getting and Cleaning Data - Course Project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis

## Project Files

1. **run_analysis.R**

The included R script, `run_analysis.R`, conducts the following:

- Load the necessary libraries to prepare the data
- Download the dataset from the web if it does not already exist in the working directory
- Merge the training and the test sets to create one data set
- Extract only the measurements on the mean and standard deviation for each measurement
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names
- Create a second, independent tidy data set with the average of each variable for each activity and each subject
- Save data sets, in this case, `tidy_data.txt`

2. **tidy_data.txt**

- Data set with the average of each variable for each activity and each subject presented in a tidy way

3. **CodeBook.md**

- The file `CodeBook.md` describes the processing steps and variables used in `run_analysis.R` and supplements the `README.md`

4. **coursera-getting-and-cleaning-data-project.Rproj**

- A file that enables the R project to be bundled in a portable and self-contained folder

5. **.gitignore**

- A file that specifies intentionally untracked files that Git should ignore

6. **data**

- The necessary data obtained [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) to carry out the project 
