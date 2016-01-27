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

Codebook: 

General naming scheme:
- t = time
- f = frequency
- body = body motion
- gravity = gravitational motion
- acc = accelerometer
- jerk = signals, derived from accelerometer and angular velocity
- gyro = gyroscope (measures angular velocity)
- mag = magnitude
- mean = mean
- std = standard deviation
- x = x coordinate
- y = y coordinate
- z = z coordinate

Variable Names:
"1" "subjects"- numerical code for research subject (1-30)
"2" "activity"- Name for type of activity (walking, walking upstairs, walking 
                                          downstairs, sitting, standing, laying)

"3" "tbodyaccmeanx"- mean body from accelerometer for x coodinate measured in time 
"4" "tbodyaccmeany"- mean body from accelerometer for y coodinate measured in time 
"5" "tbodyaccmeanz"- mean body from accelerometer for z coodinate measured in time 

"6" "tgravityaccmeanx"- mean gravity from accelerometer for x coodinate measured in time 
"7" "tgravityaccmeany"- mean gravity from accelerometer for y coodinate measured in time
"8" "tgravityaccmeanz"- mean gravity from accelerometer for z coodinate measured in time

"9" "tbodyaccjerkmeanx"- mean body jerk from from accelerometer for x coodinate measured in time
"10" "tbodyaccjerkmeany"- mean body jerk from from accelerometer for y coodinate measured in time
"11" "tbodyaccjerkmeanz"- mean body jerk from from accelerometer for z coodinate measured in time

"12" "tbodygyromeanx"- mean body angle from gyroscope for x coodinate measured in time
"13" "tbodygyromeany"- mean body angle from gyroscope for y coodinate measured in time
"14" "tbodygyromeanz"- mean body angle from gyroscope for z coodinate measured in time

"15" "tbodygyrojerkmeanx"- mean body jerk from gyroscope for x coodinate measured in time
"16" "tbodygyrojerkmeany"- mean body jerk from gyroscope for y coodinate measured in time
"17" "tbodygyrojerkmeanz"- mean body jerk from gyroscope for z coodinate measured in time

"18" "tbodyaccmagmean"- mean magnitude of body from accelerometer for x coodinate measured in time
"19" "tgravityaccmagmean"- mean magnitude of from accelerometer from gravity measured in time
"20" "tbodyaccjerkmagmean"- mean magnitude of jerk signal from accelerometer from body measured in time
"21" "tbodygyromagmean"- mean magnitude of body angle from gyroscope measured in time
"22" "tbodygyrojerkmagmean"- mean magnitude of body jerk signal from gyroscope measured in time
"23" "fbodyaccmeanx"- mean body from accelerometer of the x coordinate measured in frequency
"24" "fbodyaccmeany"- mean body from accelerometer of the y coordinate measured in frequency
"25" "fbodyaccmeanz"- mean body from accelerometer of the z coordinate measured in frequency
"26" "fbodyaccjerkmeanx"- mean body jerk signal from accelerometer of the x axis measured in frequency
"27" "fbodyaccjerkmeany"- mean body jerk signal from accelerometer of the y axis measured in frequency
"28" "fbodyaccjerkmeanz"- mean body jerk signal from accelerometer of the z axis measured in frequency
"29" "fbodygyromeanx"- mean body from gyroscope of the x axis measured in frequency
"30" "fbodygyromeany"- mean body from gyroscope of the y axis measured in frequency
"31" "fbodygyromeanz"- mean body from gyroscope of the z axis measured in frequency
"32" "fbodyaccmagmean"- mean body magnitiude from accelerometer measured in frequency
"33" "fbodybodyaccjerkmagmean"- mean magnitude of body jerk signal from accelerometer measured in frequency
"34" "fbodybodygyromagmean"- mean magnitude of body from gyroscope measured in frequency
"35" "fbodybodygyrojerkmagmean"- mean magnitude of jerk signal from body from gyroscope measured in frequency
"36" "tbodyaccstdx"- standard deviation of mean body from accelerometer for x coodinate measured in time 
"37" "tbodyaccstdy"- standard deviation of body from accelerometer for y coodinate measured in time
"38" "tbodyaccstdz"- standard deviation of body from accelerometer for z coodinate measured in time

(39-68: descriptions same as 3-38. but standard deviation instead of mean)
"39" "tgravityaccstdx"- 
"40" "tgravityaccstdy"- 
"41" "tgravityaccstdz"- 
"42" "tbodyaccjerkstdx"- 
"43" "tbodyaccjerkstdy"- 
"44" "tbodyaccjerkstdz"- 
"45" "tbodygyrostdx"- 
"46" "tbodygyrostdy"- 
"47" "tbodygyrostdz"- 
"48" "tbodygyrojerkstdx"- 
"49" "tbodygyrojerkstdy"- 
"50" "tbodygyrojerkstdz"- 
"51" "tbodyaccmagstd"-
"52" "tgravityaccmagstd"- 
"53" "tbodyaccjerkmagstd"- 
"54" "tbodygyromagstd"- 
"55" "tbodygyrojerkmagstd"- 
"56" "fbodyaccstdx"-
"57" "fbodyaccstdy"- 
"58" "fbodyaccstdz"- 
"59" "fbodyaccjerkstdx"- 
"60" "fbodyaccjerkstdy"- 
"61" "fbodyaccjerkstdz"- 
"62" "fbodygyrostdx"- 
"63" "fbodygyrostdy"- 
"64" "fbodygyrostdz"- 
"65" "fbodyaccmagstd"- 
"66" "fbodybodyaccjerkmagstd"- 
"67" "fbodybodygyromagstd"- 
"68" "fbodybodygyrojerkmagstd"- 
