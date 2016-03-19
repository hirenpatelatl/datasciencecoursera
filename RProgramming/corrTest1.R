# corrTest
print("corr 150 threshold")
source("corr.R")
source("complete.R")
cr <- corr("specdata", 150)
print(head(cr))
print(summary(cr))

##########
print("corr 400 threshold")
cr <- corr("specdata", 400)
print(head(cr))
print(summary(cr))

###########
print("corr 500 threshold")
cr <- corr("specdata", 5000)
print(summary(cr))
print(length(cr))

########
print("corr default 0 threshold")
cr<-corr("specdata")
print(summary(cr))
print(length(cr))

