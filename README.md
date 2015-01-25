# data-cleaning-project

This directory contains a single program `run_analysis.R` which analyzes the data for the data cleaning project of coursera course "Getting and Cleaning Data".

It reads the "test" and "training" data separately and concatentes them into a single data frame and performs aggregate function `mean` for each subject and each activity and saves the contents of the output. The output is saved here as `output.txt`.

To read the training and testing data, it reads the three data files, the measurements, the subject labels for the measurements and activity lables for the measurements. It then uses the previously loaded textual description of activity labels and assigns them. It also filters the measurements so that only `mean` and `std` values are chosen and the others are discarded.

### Code book

* **`test_data`** data loaded from the test dataset
* **`train_data`** data loaded from the training dataset
* **`data`** union of test and training data
* **`output`** aggrgate (mean) for each activity for each subject from `data`
* **`readdata`** a function that reads the measurements, activity lablels and subject labels and returns a single data frame after removing measurements other than means and stds.
* **`filename`** A function that returns a filename based on the type (`train` or `test`) and data (`X`, `y` or `activity`)
* **`features`** Feature labels
* **`desired_features`** Labels for the features we are interested in (i.e. mean and std variables)
* **`activities`** Activity labels



