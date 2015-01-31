# Getting-and-Cleaning-Data
Class Project

#run_analysis.R 

In order to run this code, you must have the UCI HAR dataets downloaded, unzipped, and saved in your home directory, which is also the working directory.  

Two packages must be installed prior to running the codel reshape2 and data.table.  Several functions used in the code, including melt, dcast, and read.tale refer to these two packages. 

The run_analysis.R script must also be present in the home directory.  
This code loads test and train datasets from a public source and integrates them into one. 

Explanation of code:
1) The first step is to load the datasets from the home directory where they are saved.  
2) The second step is to extract the measurements for the mean and standard deviation for each measurement using the grepl function.
3) The third step merges the training and test datasets into one combined dataset using the cbind function.  
4) The fourth step is to label the dataset headers with different descriptive names
5) Finally, the last step creates a new independent dataset called tidy_detaset.txt, which contains the averages for each variable for each activity and each subjec from the previous dataset.  This file is generated and stored in the home directory and must be retrieved from there.   

