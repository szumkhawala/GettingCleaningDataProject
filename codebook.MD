##Steps to extract, clean and shape data


	##Step 1 - Combine test maindata, activity data and subject data

	##Step 2 - Combine train maindata, activity data and subject data

	##Step 3 - Combine test and train data into one dataset

	##Step 4 - Assign Column Headers to main dataset from features.txt. Set manual column names for columns not in features.txt

	##Step 5 - Remove unwanted columns (Keep only identifiers and columns with mean() or std() text)

	##Step 6 - aggreagate data by subject and activity and calculate mean

	##Step 7 - Read in activity labels and give appropriate names to columns

	##Step 8 - merge main dataset and activity label

	##Step 9 - remove unwanted columns



##Description of final dataset

	##the final dataset is stored in the data frame "finalFinalData"

	##the final dataset has 80 columns

	##Variables

		"activity" - Activity Type (character)- 1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

                      
		"subject"  - The Subject (integer)

		"[Other 78 Columns] (numeric) - These are all columns with std() or mean() in the tesxt of the data. All numeric                       
