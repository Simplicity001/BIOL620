#Author: Daniel, Date: Mar 8 2022, Purpose: To make fold change
setwd("/Users/danieloyeka/Desktop/CEL assignment")
library(affy)
eset <- ReadAffy()
eset_Norm <- rma(eset)
rma <- exprs(eset_Norm)
boxplot(rma)
head(rma)
Treatment <- apply(rma[,c("GSM153813.CEL","GSM153814.CEL","GSM153815.CEL","GSM153816.CEL","GSM153817.CEL")],1,log)
Control<- apply(rma[,c("GSM4843.CEL","GSM4844.CEL","GSM4845.CEL","GSM4846.CEL","GSM4847.CEL")],1,log)
head(Treatment)
#TRANSPOSE: Switch columns to rows and rows to columns and its done for fold change because on the matrix genes have to be rows and samples are columns. 
#Perform transpose so that samples are your columns and genes are your rows
Treatment_T <- t(Treatment)
Control_T <- t(Control)

#To make fold chnages we first need to take mean/average for treatment and control samples
Treatment_T_Mean <- rowMeans(Treatment_T)
Control_T_Mean <- rowMeans(Control_T)

#Get the subtraction fold change for treatment over control

Fold_change<- Treatment_T_Mean-Control_T_Mean

#Assignment : Export variable "Fold_Change" as a .csv formnat file with the name "fold_changes.csv"
write.csv(Fold_change, "fold_changes.csv", row.names=TRUE)
