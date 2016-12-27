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
######################################################
plot(training_data)
plot(training_data$Age ~ training_data$Default)