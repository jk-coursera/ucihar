library(dplyr);

ucihar_load <- function(path)
{
  # `path` is the path to the extracted UCI HAR dataset.
  
  if(!dir.exists(path))
  {
    stop("UCI HAR data directory does not exist: ", path);
  }
  
  # Load pre-processed data
  
  # "X_*.txt" contains a large set of 561-element vectors.
  # Each of the 561 elements have a corresponding name in "features.txt"
  # X is split between "test/X_test.txt" and "train/X_train.txt"
  # "Y_*.txt" contains a single value corresponding to labels in activities
  
  # ... read feature names
  features <- read.table(file.path(path, "features.txt"), header=FALSE);
  activities <- read.table(file.path(path, "activity_labels.txt"), header=FALSE, col.names = c("Activity.ID", "Activity.Name"));
  
  # ... read training data
  train <- read.table(file.path(path, "train", "X_train.txt"), header=FALSE, col.names = features$V2);
  
  # ... read training labels, append column to `train`
  train <- cbind(train, read.table(file.path(path, "train", "Y_train.txt"), header=FALSE, col.names = c("Activity.ID")));
  
  # ... read training subjects, append column to `train`
  train <- cbind(train, read.table(file.path(path, "train", "subject_train.txt"), header=FALSE, col.names = c("Subject.ID")));
  
  # ... read testing data
  test <- read.table(file.path(path, "test", "X_test.txt"), header=FALSE, col.names = features$V2);
  
  # ... read testing labels, append column to `test`
  test <- cbind(test, read.table(file.path(path, "test", "Y_test.txt"), header=FALSE, col.names = c("Activity.ID")));
  
  # ... read testing subjects, append column to `test`
  test <- cbind(test, read.table(file.path(path, "test", "subject_test.txt"), header=FALSE, col.names = c("Subject.ID")));
  
  # ... combine the two sets
  ucihar <- rbind(train, test);
  
  # ... clean up intermediate data frames
  rm(test, train);
  
  # Join on "activities"
  
  ucihar <- inner_join(ucihar, activities, by = "Activity.ID");
  
  # Skipping the inertial signals...
  # -- not specified in requirements
  # -- not sure about format of data
  
  # Return data set
  ucihar;
}

ucihar_tidy <- function(ucihar)
{
  # Reduce data to only those columns containing "std" or "mean", and "Subject.ID" and "Activity.Name"
  
  features_tidy <- c("Subject.ID", "Activity.Name", grep("std[.]{3}|mean[.]{3}", names(ucihar), value=TRUE));
  
  ucihar <- select(ucihar, features_tidy);
  
  # Rename columns with descriptive names
  features_tidy <- lapply(features_tidy, function(feature) {
    
    # Time/Freq Domain
    feature <- gsub("^t", "Time.Domain.", feature);
    feature <- gsub("^f", "Frequency.Domain.", feature);
    
    # Std/Mean
    feature <- gsub("std[.]{2}", "Std.Dev.", feature);
    feature <- gsub("mean[.]{2}", "Mean.", feature);
    
    # Axis
    feature <- gsub("[.]?X$", "X.Axis", feature);
    feature <- gsub("[.]?Y$", "Y.Axis", feature);
    feature <- gsub("[.]?Z$", "Z.Axis", feature);
    
    # Feature
    feature <- gsub("Body[.]?", "Body.", feature);
    feature <- gsub("Gravity[.]?", "Gravity.", feature);
    feature <- gsub("Acc[.]?", "Acceleration.", feature);
    feature <- gsub("Gyro[.]?", "Gyro.", feature);
    feature <- gsub("Jerk[.]?", "Jerk.", feature);
    
    feature;
  });
  
  # Change column names
  colnames(ucihar) <- features_tidy;
  
  # Return tidied set
  ucihar;
}

ucihar_summarize <- function(ucihar)
{
  ucihar_grouped <- group_by(ucihar, Subject.ID, Activity.Name);
  
  features_to_summarize <- names(select(ucihar, -Subject.ID, -Activity.Name))
  
  summarize_at(ucihar_grouped, features_to_summarize, mean, na.rm = TRUE);
}

run_analysis <- function()
{ 
  # You should create one R script called run_analysis.R that does the following:
  
  # 1. Merges the training and the test sets to create one data set.
  ucihar <- ucihar_load("./UCI HAR Dataset");
  
  # 2. Extracts only the measurements on the mean and standard deviation for each measurement.
  # 3. Uses descriptive activity names to name the activities in the data set
  # 4. Appropriately labels the data set with descriptive variable names.
  ucihar_tidied <- ucihar_tidy(ucihar);
  
  # 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  ucihar_summarized <- ucihar_summarize(ucihar_tidied);
  
  # Write data out
  
  write.table(ucihar_summarized, "ucihar_summary.txt", row.name=FALSE);
}