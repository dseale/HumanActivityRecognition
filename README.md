### Human Activity Recognition Using Smartphones

The data used in this project was collected from the accelerometers of the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

### Included files

* `run_analysis.R`: The primary script that contains the functions for downloading, merging, and cleaning the original source data.
* `CodeBook.md`: Description of the output data, variables, and transformations used on the source data to generate the tidy output files.
* `HumanActivityRecognitionData.txt`: (default settings). The data set which contains an average of each variable for each activity and each test subject.

### Script Execution Steps

- Load the script `run_analysis.R` into your environment.  Uses the `dplyr` package for averaging measurements in the output data set.
- Run the function `downloadData()` to download and unzip the source dataset.  This function will set a global environment variable, `g_Directory` which is used by the `mergeAndCleanData()` function.  If you have a new environment or have recently reset your environment, you will need to run this function first.  See the function reference below for additional information and default settings.
- Run the function `mergeAndCleanData()` to load the raw source files and create the final data set. If data has already been downloaded and you wish to create a new data set with new measurements or file names, it is not necessary to run `downloadData()` again within the same environment context.

The beginning of the script file contains a list of constants named `constants`.  If the source data used by this project changes or you wish to change the names or output format of the cleaned data file, you can change the elements in this list.

#### Sample Script Execution (defaults)

`source("run_analysis.R")`  
`downloadData()`  
`mergeAndCleanData()`
  
***
#### Function Reference (run_analysis.R)

***
**downloadData**

##### Description
Used to download and unzip remote source data to a provided target directory and file.  Will verify existence of downloaded and unzipped data unless forced to requery and extract.

##### Usage

`downloadData(targetDirectory="Data", targetFile="SourceData.zip", forceDownload=FALSE, reExtract=FALSE)`

Argument | Description
---------|---------------------------------------------------------
`targetDirectory`| Specifies the directory to download the raw source.  Defaults to `Data`.
`targetFile`| The name of the downloaded source zip file.  Defaults to `SourceData.zip`.
`forceDownload`| When `TRUE`, will redownload the original source even if it exists.  Defaults to `FALSE`
`reExtract`| When `TRUE`, will unzip the downloaded source files even if it exists.  Defaults to `FALSE`

***
**mergeAndCleanData**

##### Description
Merges downloaded training and test data sets as specified in the `constants` list. Filters by a supplied regular expression and creates a data set as specified in the `constants` list.  If a different regular expression is provided to extract measurements, the `rename()` function can be altered in order to adjust descriptive labels for the exported data set.

##### Usage

`mergeAndCleanData(extractRegEx="mean\\(|std\\(")`

Argument | Description
---------|----------------------------------------------------------------------
`extractRegEx`| The regular expression to filter the raw data measurements. 

