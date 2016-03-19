complete <- function(directory, id=1:332, debug=FALSE){
	library(dplyr)

    fileValues<-data.frame(fileIndex=id, nobs=NA)

    for (Index in id){
		    updateValues<-getValuesForFile(directory,Index)   
		    fileValues$nobs[fileValues$fileIndex==Index]<-updateValues["completeCases"]
	}
    fileValues
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

getValuesForFile<-function(directory,currentIndex,column) {
	fileContents<-read.csv(paste(directory,"/",genFileName(currentIndex),sep=""))
	list_of_complete_cases<-fileContents[complete.cases(fileContents),]
	##print(fileContents)
	completeCases<-length(list_of_complete_cases[,1])
    c(completeCases=completeCases)
}    

