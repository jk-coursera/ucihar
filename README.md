# Getting and Cleaning Data - Week 4 Project

## About

`run_analysis.R` is an R script that contains functions for working with [UCI's Human Activity Recognition Using Smartphones Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Dependencies

### UCI HAR Dataset

This script assumes that the UCI HAR dataset has been downloaded and extracted, and the "UCI HAR Dataset" folder is accessible in the current working directory within R.

### dplyr

This script is dependent on `dplyr`.

Install `dplyr` using `install.packages`:

    > install.packages("dplyr");

## Functions

### `run_analysis`

Performs the following analysis of the UNI HAR Dataset:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Assumes the data set is available in the folder `./UCI HAR Dataset` relative to the current working directory.

The result from the analysis (step 5) is written to the file `ucihar_summary.txt` in current working directory.

Parameters:

* None

Returns:

No return value.

<hr/>

### `ucihar_load`

Loads UCI HAR data into a data frame. It combines the training and the test data sets into one data frame. (The inertial data is not included.)

Parameters:
* `path` - the path to the extracted "UCI HAR Dataset".

Returns:

A data frame containing the UCI HAR data.

<hr/>

### `ucihar_tidy`

Reduces the data frame loaded with `ucihar_load` to a smaller set of variables and provides nicer names for the variables.

Parameters:

* `ucihar` - the UCI HAR data set loaded from `ucihar_load()`.

Returns:

A simplified version of the provided data frame.

<hr/>

### `ucihar_summarize`

Provides the mean of all observed variables, grouped by Subject ID and Activity Name.

Parameters:

* `ucihar` - the UCI HAR dataset produced by `ucihar_tidy`.

Returns:

A summary data frame of the means of all observed variables, grouped by `Subject.ID` and `Activity.Name` columns.
