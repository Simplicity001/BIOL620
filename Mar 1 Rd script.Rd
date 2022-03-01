#Author: Daniel, Date: Mar 1 2022, Purpose: To generate box plots for raw 
#setting working directory
setwd("/Users/danieloyeka/Desktop/CEL assignment")
#Read affy library
library(affy)
#set affy ro eset
eset <- ReadAffy()
#mormalization
eset_Norm <- rma(eset)
#storing value to function rma
rma <- exprs(eset_Norm)
#Giving the first few lines of the rma function
head(rma)
#Scaling down values, performing log transformation #log base 2 or base 10
Treatment <- apply(rma[,c("GSM153813.CEL","GSM153814.CEL","GSM153815.CEL","GSM153816.CEL","GSM153817.CEL")],1,log)
Control<- apply(rma[,c("GSM4843.CEL","GSM4844.CEL","GSM4845.CEL","GSM4846.CEL","GSM4847.CEL")],1,log)
head(Treatment)