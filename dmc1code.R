#DMC1 Team "The Black Swan"

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
table(t1data$CarInsurance)
t1data$CarInsurance = factor(t1data$CarInsurance, labels = c("no", "yes"))
te1data$CarInsurance = factor(te1data$CarInsurance, labels = c("no", "yes"))
