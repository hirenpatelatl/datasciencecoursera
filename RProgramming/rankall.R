rankall<-function(outcome_from_user, num="best")
{ 
	#state="NY"
	#outcome="Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
	# Lookup lowest 30 day mortality rate for that specified state in the last 30 days
	# Error out request with incorrect state or outcome measures
	# Output hospital with minimum values and use alphabetic order to break ties


   
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
	df<-outcome_file[complete.cases(outcome_file),c(outcome,"State","Hospital.Name")]
    df$rank<-ave(df[[outcome]],df$State, FUN= function(x) rank(x,ties.method = "first")) 
    # df$rank<-ave(df$,df$State, FUN= function(x) rank(x,ties.method = "first"))

        if (num=="best")
    {

        return(df[df$rank==1,])
        #return(rows_with_min_outcome_values[,"Hospital.Name"])
    }
    else if (num=="worst")
    {
        return(aggregate(x=df, by=list(df$State), FUN=max))
        # raggregate(x=df, by=list(df$State), FUN=max)
    }
    else if (is.numeric(num))
    {

        return(df[df$rank==num,])
    } 
    else
    {
        stop("invalid rank request")
    }
}