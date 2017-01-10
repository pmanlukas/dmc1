#DMC1 Team "The Black Swan"

######################################################
# The caret package is used (http://topepo.github.io/caret/index.html)
#install.packages("caret")
library(caret)

#clear environment variables
rm(list=ls())

# For reasons of traceability you must use a fixed seed
set.seed(42) # do NOT CHANGE this seed


######################################################
# 2. Load & Explore the Training Data Set
setwd("C:/Users/lukaspman/Documents/BaR")
training_data = read.csv("trainingDMC1.csv", sep=",")
test_data = read.csv("testDMC1.csv", sep=",")
######################################################

##fix the datatypes of the data set
#create new dataframe to do altering on the attributes, without damaging our original df
t1data = training_data
te1data = test_data

#inspect the data set
str(t1data)
table(t1data$Job)

##fix all yes/no attributes
#fix Default
table(t1data$Default)
t1data$Default = factor(t1data$Default, labels = c("no", "yes"))
te1data$Default = factor(te1data$Default, labels = c("no", "yes"))


#fix HHInsurance
t1data$HHInsurance = factor(t1data$HHInsurance, labels = c("no", "yes"))
te1data$HHInsurance = factor(te1data$HHInsurance, labels = c("no", "yes"))

table(t1data$HHInsurance)

#fix CarLoan
table(t1data$CarLoan)
t1data$CarLoan = factor(t1data$CarLoan, labels = c("no", "yes"))
te1data$CarLoan = factor(te1data$CarLoan, labels = c("no", "yes"))


#fix CarInsurance
#here just the training data, because the test set will be predicted
table(t1data$CarInsurance)
t1data$CarInsurance = factor(t1data$CarInsurance, labels = c("no", "yes"))


##fix all time attributes
#make the call time attributes in the same date format
t1data$CallStart = as.POSIXct(t1data$CallStart, format="%H:%M:%S")
t1data$CallEnd = as.POSIXct(t1data$CallEnd, format="%H:%M:%S")
te1data$CallStart = as.POSIXct(te1data$CallStart, format="%H:%M:%S")
te1data$CallEnd = as.POSIXct(te1data$CallEnd, format="%H:%M:%S")
#new attribute that gives the duration of a call
t1data$call_duration = as.numeric(t1data$CallEnd - t1data$CallStart)
te1data$call_duration = as.numeric(te1data$CallEnd - te1data$CallStart)

##fix other attributes
table(t1data$Job, useNA = "always")
table(t1data$Outcome, useNA = "always")

#days since the last contact, -1 means, no previous contact --> create a new attribute
#that tells if client was contacted or not
table(t1data$DaysPassed, useNA = "always")

t1data$prev_contact = factor(rep("NA", nrow(t1data)), levels=c("NA", "Yes", "No"))
te1data$prev_contact = factor(rep("NA", nrow(te1data)), levels=c("NA", "Yes", "No"))

t1data$prev_contact[t1data$DaysPassed < 0] = "No"
te1data$prev_contact[te1data$DaysPassed < 0] = "No"

t1data$prev_contact[t1data$DaysPassed >= 0] = "Yes"
te1data$prev_contact[te1data$DaysPassed >= 0] = "Yes"

table(t1data$prev_contact)
table(te1data$prev_contact)