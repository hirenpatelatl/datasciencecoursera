pollutantmean <- function(directory, pollutant, id=1:332, debug=FALSE){
	library(dplyr)
	setwd(directory)

    fileValues<-data.frame(fileIndex=id, Pollutant=pollutant, RecordCount=NA,NAFilterCount=NA,NAFilterSum=NA,MeanVal=NA)

    for (Index in id){
		    updateValues<-getValuesForFile(Index,pollutant)   
		    fileValues$RecordCount[fileValues$fileIndex==Index]<-updateValues["RecordCount"]
		    fileValues$NAFilterCount[fileValues$fileIndex==Index]<-updateValues["NAFilterCount"]
		    fileValues$NAFilterSum[fileValues$fileIndex==Index]<-updateValues["NAFilterSum"]
		    fileValues$MeanVal[fileValues$fileIndex==Index]<-updateValues["MeanVal"]
	}

    MeanAcrossFiles<-sum(fileValues$NAFilterSum)/sum(fileValues$NAFilterCount)
    if (debug==TRUE) {
    	print(fileValues)
    	print("Mean Across Files")
    	print(MeanAcrossFiles)
    	print("RecordCount")
    	print(sum(fileValues$RecordCount))
    } 

    MeanAcrossFiles
}
genFileName<-function(currentIndex) {    	

    if (currentIndex<10) {
     zeroPad<-"00"
    }
    else if (currentIndex<100) {
    	zeroPad<-"0"
    }
    else{
    	zeroPad<-""
    }

    paste(zeroPad,currentIndex,".csv",sep="")   
}

getValuesForFile<-function(currentIndex,column) {
	fileContents<-read.csv(genFileName(currentIndex))
	list_of_NA_filtered_vals<-fileContents[complete.cases(fileContents),c(column)]
	##print(fileContents)
	totalCount<-length(fileContents[,1])
	NAFilterSum<-sum(list_of_NA_filtered_vals)
	NAFilterCount<-length(list_of_NA_filtered_vals)
	MeanVal<-mean(list_of_NA_filtered_vals)
    c(RecordCount=totalCount,NAFilterCount=NAFilterCount,NAFilterSum=NAFilterSum,MeanVal=MeanVal)
}    





## mean(read.csv(genFileName(1))[complete.cases(read.csv(genFileName(1))),c(pollutant)])

## sumPollutants/countPollutants

