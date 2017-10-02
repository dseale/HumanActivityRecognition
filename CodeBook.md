### Code Book for Human Activity Recognition Using Smartphones

### Data
Orignal source data for sensors signals was utiltized from the following source:
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

A full description of the raw data used is available at the site where data was obtained:
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The following two data sets (defaults) are produced by the script `run_analysis.R`.  Refer to the `README.md` file for script usage, changing default output values, or other information regarding the creation of the data sets or the ability to manipulate the output.

* `HumanActivityRecognitionData.txt` Provides a clean version of the merged source data, filtered by type of analysis performed. Averages each variable for each activity and each subject.  Uses a `,` separator for the output file.

### Variables

* `subject` - The numeric ID of the subject undergoing the test. Ranges from 1:30.
* `activity` - One of six types of activities performed by each subject.
	- WALKING
	- WALKING_UPSTAIRS
	- WALKING_DOWNSTAIRS
	- SITTING
	- STANDING
	- LAYING
	
The following accelerometer and gyroscope sensor signals are included by default in the output file.  `mean()` and `std()` (standard deviation) are the default measures tracked but can be changed.  Measurements are either from the time domain or frequency domain with variables prefixed with "Time" or "Frequency" respectively.

* `TimeBodyAccelerometerMeanX`	
* `TimeBodyAccelerometerMeanY`	
* `TimeBodyAccelerometerMeanZ`	
* `TimeBodyAccelerometerStdDevX`	
* `TimeBodyAccelerometerStdDevY`	
* `TimeBodyAccelerometerStdDevZ`	
* `TimeGravityAccelerometerMeanX`	
* `TimeGravityAccelerometerMeanY`	
* `TimeGravityAccelerometerMeanZ`	
* `TimeGravityAccelerometerStdDevX`	
* `TimeGravityAccelerometerStdDevY`	
* `TimeGravityAccelerometerStdDevZ`	
* `TimeBodyAccelerometerJerkMeanX`	
* `TimeBodyAccelerometerJerkMeanY`	
* `TimeBodyAccelerometerJerkMeanZ`	
* `TimeBodyAccelerometerJerkStdDevX`	
* `TimeBodyAccelerometerJerkStdDevY`	
* `TimeBodyAccelerometerJerkStdDevZ`	
* `TimeBodyGyroscopeMeanX`	
* `TimeBodyGyroscopeMeanY`	
* `TimeBodyGyroscopeMeanZ`	
* `TimeBodyGyroscopeStdDevX`	
* `TimeBodyGyroscopeStdDevY`	
* `TimeBodyGyroscopeStdDevZ`	
* `TimeBodyGyroscopeJerkMeanX`	
* `TimeBodyGyroscopeJerkMeanY`	
* `TimeBodyGyroscopeJerkMeanZ`	
* `TimeBodyGyroscopeJerkStdDevX`	
* `TimeBodyGyroscopeJerkStdDevY`
* `TimeBodyGyroscopeJerkStdDevZ`	
* `TimeBodyAccelerometerMagnitudeMean`	
* `TimeBodyAccelerometerMagnitudeStdDev`	
* `TimeGravityAccelerometerMagnitudeMean`	
* `TimeGravityAccelerometerMagnitudeStdDev`	
* `TimeBodyAccelerometerJerkMagnitudeMean`	
* `TimeBodyAccelerometerJerkMagnitudeStdDev`	
* `TimeBodyGyroscopeMagnitudeMean`	
* `TimeBodyGyroscopeMagnitudeStdDev`	
* `TimeBodyGyroscopeJerkMagnitudeMean`	
* `TimeBodyGyroscopeJerkMagnitudeStdDev`	
* `FrequencyBodyAccelerometerMeanX`	
* `FrequencyBodyAccelerometerMeanY`	
* `FrequencyBodyAccelerometerMeanZ`	
* `FrequencyBodyAccelerometerStdDevX`	
* `FrequencyBodyAccelerometerStdDevY`	
* `FrequencyBodyAccelerometerStdDevZ`	
* `FrequencyBodyAccelerometerJerkMeanX`	
* `FrequencyBodyAccelerometerJerkMeanY`	
* `FrequencyBodyAccelerometerJerkMeanZ`	
* `FrequencyBodyAccelerometerJerkStdDevX`	
* `FrequencyBodyAccelerometerJerkStdDevY`	
* `FrequencyBodyAccelerometerJerkStdDevZ`	
* `FrequencyBodyGyroscopeMeanX`	
* `FrequencyBodyGyroscopeMeanY`	
* `FrequencyBodyGyroscopeMeanZ`	
* `FrequencyBodyGyroscopeStdDevX`	
* `FrequencyBodyGyroscopeStdDevY`	
* `FrequencyBodyGyroscopeStdDevZ`	
* `FrequencyBodyAccelerometerMagnitudeMean`	
* `FrequencyBodyAccelerometerMagnitudeStdDev`	
* `FrequencyBodyAccelerometerJerkMagnitudeMean`	
* `FrequencyBodyAccelerometerJerkMagnitudeStdDev`	
* `FrequencyBodyGyroscopeMagnitudeMean`	
* `FrequencyBodyGyroscopeMagnitudeStdDev`	
* `FrequencyBodyGyroscopeJerkMagnitudeMean`	
* `FrequencyBodyGyroscopeJerkMagnitudeStdDev`

### Transformations

The following actions were applied to the source data in order to provide a clean set of measurements.

* The training and test data sets consisting of measurements, subjects, and activity identifiers were merged using a regular expression filter to access only the mean() and std() formula measurements.
* Measurement variable names were replaced with more descriptive names and bound to the merged source.
* Numeric activity identifiers were replaced with the descriptive names for each activity.
* From the base cleaned data set, a second, independent data set with the average of each variable for each activity and each subject was created and written to the working directory.

