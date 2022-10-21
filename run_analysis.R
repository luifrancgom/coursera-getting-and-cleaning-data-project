# Load libraries
library(tidyverse)

# Get data

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
