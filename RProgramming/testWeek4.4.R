source("RankHospitals.R")
print("TX heart failure")
print(rankhospital("TX","heart failure"))

print("TX heart failure 1")
print(rankhospital("TX","heart failure",1))

print("TX heart failure 4")
print(rankhospital("TX","heart failure",4))

print("TX heart failure 4")
print(rankhospital("TX","heart failure",4))

print("MD heart attack worst")
print(rankhospital("MD","heart attack","worst"))

print("MN heart attack worst")
print(rankhospital("MN","heart attack",5000))

print("TX heart failure worst")
print(rankhospital("TX","heart failure","worst"))
#print(rankhospital("TX","heart failure","foo"))
