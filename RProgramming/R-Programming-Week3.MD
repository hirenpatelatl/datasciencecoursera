# R Programming Week3

# Looping on the command line
lapply: Loop over a list adn evaluate a function on each element
sapply: Same as lapply but try to simplify the result
apply: Apply a function over the margins of an array
tapply: 

# lapply 
lapply takes three arguments: 
1. a list x
2. function to be applied to each element of the list
3. other argmuments

# lapply always returns a list, regardless of the class of the input

# sapply will try to simplfy the result of lapply if possible:
* If the results ia a list where every element is length 1, then a vector is returned

# 



> tapply(flags$population, flags$red, summary)
$`0`
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   0.00    0.00    3.00   27.63    9.00  684.00 

$`1`
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    0.0     0.0     4.0    22.1    15.0  1008.0 