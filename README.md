How the script works: 

This script reads in activity data from Samsung Galaxy S smart phone generated 
by a research study about human activity recognition by smart phones. Further
information about the data can be found here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data are fragmented into several files:

Main folder:
- activity_labels.txt: contains information about what the activity codes mean
- features.txt: contains the variable names

Test folder:
- X_test.txt: contains the data for all but activity type
- y_test.txt: contains activity type data
- subject_test: contains the subject IDs

Train folder: same as test folder, replacing train for test

The script reads in and combines the data, subject, and activity codes for 
both the test and the training data separately. Columns for subject and activity
are added to the main data dataframe, and proper variable names are applied. 
Then, the test and the train dataset are combined into one dataframe. 

After the data are combined, the activity lavels are read and applied to the 
activity column.

The data is then limited to columns representing the mean and standard deviation 
values, and the variable names are modified to comply with data integrity best
practices. 

Finally, the data are divided by subject and activity, and summary statistics
for these groups are generated and stored in a tidy data set. 