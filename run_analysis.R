##Set directory to test data folder
	setwd("C:/Development/GettingCleaningData/Project3/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test")

##Read in datasets from test text files 
	testMainData<-read.table("X_test.txt")
	testActivityData<-read.table("y_test.txt")
	testSubjectData<-read.table("subject_test.txt")

##Combine datasets into one test data frame 
	testdata<-cbind(testSubjectData,testMainData,testActivityData)


##Set directory to train data folder
	setwd("C:/Development/GettingCleaningData/Project3/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train")

##Read in datasets from train text files
	trainMainData<-read.table("X_train.txt")
	trainActivityData<-read.table("Y_train.txt") 
	trainSubjectData<-read.table("subject_train.txt")

##Combine datasets into one train data frame 
	traindata<-cbind(trainSubjectData,trainMainData,trainActivityData)


##combine test and train data sets
allData<-rbind(testdata,traindata)


##Set directory to main data folder
	setwd("C:/Development/GettingCleaningData/Project3/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset")

##read in file with column headers
	colHeaders<-read.table("features.txt")

##Assign column headers to the combined data set ans set additional column names
	colnames(allData)<-colHeaders$V2
	names(allData)[563]<-"activityid"
	names(allData)[1]<-"subject"

##remove unwanted columns
	filteredData<-allData[,grep("std()|mean()|activityid|subject", colnames(allData))] 


##aggregate and get mean of other data data based on activity id and subject
	aggregatedData<-aggregate(filteredData, by=list(filteredData$activityid,filteredData$subject),FUN=mean)


##Read in Activity LAbel file
	activityLabels<-read.table("activity_labels.txt")

##set column names for activity file
	names(activityLabels)[1]<-"activityid"
	names(activityLabels)[2]<-"activity"


##join the main dataset to activity labels based on activity id
	joinedToSubject <- merge(activityLabels,aggregatedData,by="activityid")


##get relevant columns
	finalData<-joinedToSubject[,grep("std()|mean()|activity|subject", colnames(joinedToSubject))]
##remove actvity id to get final data set
	finalFinalData <-subset(finalData,select=-c(activityid)) 



