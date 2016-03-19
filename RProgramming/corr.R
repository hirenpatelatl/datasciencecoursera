corr <- function(directory, threshold=0, debug=FALSE){
	library(dplyr)
    fileValues<-data.frame(monitor=dir(directory), correlationValue=NA)
    #print(threshold) 
    for (monitor in dir(directory)){ 
	   fileContents<-read.csv(paste(directory,"/",monitor,sep=""))
	   list_of_complete_cases<-fileContents[complete.cases(fileContents),]
        if(length(list_of_complete_cases[,1])>threshold){
            correlationValue<-cor(list_of_complete_cases[,c("sulfate")],list_of_complete_cases[,c("nitrate")])
            fileValues$correlationValue[fileValues$monitor==monitor]<-correlationValue   
        }
    }
    correlationFileValues<-fileValues[,"correlationValue"]   
    as.vector(correlationFileValues[complete.cases(correlationFileValues)])

}