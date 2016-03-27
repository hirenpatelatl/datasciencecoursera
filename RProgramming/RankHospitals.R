rankhospital<-function(state, outcome_from_user, num="best")
{
	#state="NY"
	#outcome="Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
	# Lookup lowest 30 day mortality rate for that specified state in the last 30 days
	# Error out request with incorrect state or outcome measures
	# Output hospital with minimum values and use alphabetic order to break ties


	if(!length(state.abb[state.abb==state])==1)
	{ 
		stop("invalid state")       
    } 


    
	library("dplyr")

	outcome_file <-read.csv("./rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = 'character')
    column_list<-names(outcome_file)
    hospital_30day_mortalitiy_columns<-column_list[grepl(pattern = "^Hospital.+30.Day.Death", column_list,ignore.case = TRUE)]
    # print(outcome_from_user)
    outcome_to_check<-gsub(" ", ".",outcome_from_user)
    # print(outcome_to_check)
    # print(hospital_30day_mortalitiy_columns)
    outcome<-hospital_30day_mortalitiy_columns[grepl(pattern=outcome_to_check,hospital_30day_mortalitiy_columns, ignore.case = TRUE)]
    print(length(outcome))
    if(length(outcome)!=1)
    {
    	stop("invalid outcome")
    }
   
    #head(outcome_file,1)
    # print(outcome_file)
	outcome_file[,outcome]<-as.numeric(outcome_file[,outcome])
    #head(outcome_file,2)
	complete_values<-outcome_file[complete.cases(outcome_file),c(outcome,"State","Hospital.Name")]
    
    state_filtered_values<-complete_values[complete_values[,"State"]==state,]
	#head(complete_values[complete_values$State==state,c(outcome,"State","Hospital.Name")])
    
	if (num=="best")
    {
        rows_with_min_outcome_values<-state_filtered_values[state_filtered_values[,outcome]==min(state_filtered_values[,outcome]),]
        rows_with_min_outcome_values[rows_with_min_outcome_values[,"Hospital.Name"]==min(rows_with_min_outcome_values[,"Hospital.Name"]),]
        return(as.matrix(rows_with_min_outcome_values))
        #return(rows_with_min_outcome_values[,"Hospital.Name"])
    }
    else if (num=="worst")
    {
        rows_with_max_outcome_values<-state_filtered_values[state_filtered_values[,outcome]==max(state_filtered_values[,outcome]),]
        rows_with_max_outcome_values[rows_with_max_outcome_values[,"Hospital.Name"]==min(rows_with_max_outcome_values[,"Hospital.Name"]),]
        return(as.matrix(rows_with_max_outcome_values))
        # return(rows_with_max_outcome_values[,"Hospital.Name"])
    }
    else if (is.numeric(num))
    {
        # print(str(state_filtered_values))
        order_by_hospital_name<-state_filtered_values[order(state_filtered_values[,"Hospital.Name"]),]
        # print(order_by_hospital_name)
        ranked_rows<-order_by_hospital_name[order(order_by_hospital_name[,outcome], decreasing=FALSE),]
        # print(ranked_rows)
        return(ranked_rows[num,])
    } 
    else
    {
        stop("invalid rank request")
    }

}