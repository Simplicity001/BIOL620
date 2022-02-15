#Author; Daniel, Date; Feb 15 2022, Purpose; To perform microarray normalization
#setting the working directory to my CEL files folder
#setwd ("/Users/danieloyeka/desktop/CEL assignment")
# Load package affy
library("affy")
# Reading the .CEL files
eset<-ReadAffy()