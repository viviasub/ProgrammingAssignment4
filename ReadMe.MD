## Description
The data are collected from the accelerometers from the Samsung Galaxy S smartphone.

* A full description at the site where the data was obtained, is available [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

* the script Download the data from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

* unzip data to a folder called data (it should contain two folders -test and train- and four txt files - activity_labels, features, features_info, and a README file)

* run the run_analysis.R script

        1. MERGES training and test
        2. EXTRACT mean() and std()
        3. REPLACE activity code with  simple name
        4. REPLACE variable name
        
* It will generate the tidy data set named tidy_data.txt by subject and activity with average of each variable

### CodeBook.md decribe the activity and variable name