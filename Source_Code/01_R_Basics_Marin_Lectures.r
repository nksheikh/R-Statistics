# BAsic Intro
x = 1:5
y = 6:10
plot(x,y)
# Importing Data``
LungCapData = read.delim("D:/Programming_Projects/R-Statistics/Datasets/LungCapData.txt")
View(LungCapData)
ls()
cat("\f")
rm(list = ls())

# BAsic Arithmetic
x = 11
x.1 = 14
y = 9
print(x)
xx = "marin"
yy = 'marin'
x+y
x-y
x*y
x/y
x^y
sqrt(x)
x^(1/2)
log(x)
exp(x)
logb(100, 10)
abs(x)

# Vectors and Matrices
x1 = c(1,3,5,7,9)
gender = c("male", "female")
2:7
seq(from = 1, to = 9, by = 1)
seq(from = 1, to = 9, by = 1/3)
seq(from = 1, to = 9, by = 0.25)
rep(1, times = 10)
rep("marin", times = 5)
rep(1:3, times = 5)
rep(seq(from = 2, to = 5, by = 0.25), times = 5)
rep(c("m", "f"), times = 5)
x = 1:5
y = seq(1,9,2)
x + 10
x - 10
x * 2
x / 2
x ^ 2
x %% 2
# Vectors of same dimensions can have arithmetic on them
x + y
x - y
x * y
x / y
x ^ y
x %% y
y[3]
y[-3]
y[1:3]
y[c(1,5)]
y[-c(1,5)]
y[y < 6]
mat = matrix(1:9, nrow=3, byrow=TRUE)
matrix(1:9, nrow=3, byrow=FALSE)
mat[1,2]
mat[c(1,3),2]
mat[2,]
mat[,1]
mat + 10
mat - 10
mat * 2
mat / 2
mat ^ 2
mat + mat
mat - mat
mat * mat
mat / mat
mat ^ mat

# Importing Data Into R
help("read.csv")
?read.csv
# csv delim = ","m csv2 delim = ";", delim delim = "\t", delim2 delim = "\t"
# The csv2 and delim2 version use INTRNL standards of "," has decimal points
data1 = read.csv(file.choose(), header=TRUE)
data2 = read.table(file.choose(), header=TRUE, sep=",")
data3 = read.delim(file.choose(), header=TRUE)
data4 = read.table(file.choose(), header=TRUE, sep="\t")
library(readxl)
# Excel stuff here

# Exporting Data
write.table(DataToExport, file="ExportedFileName.csv", sep=",")
write.table(DataToExport, file="ExportedFileName.csv", sep=",", rows.names=FALSE)
write.csv(DataToExport, file="ExportedFileName.csv", rows.names=FALSE)
write.table(DataToExport, file="ExportedFileName.csv", rows.names=FALSE, sep="\t")
write.table(DataToExport, file="ExportedFileName.csv", rows.names=FALSE, sep=" ")

# Importing, Checking, Working w/ Data
dim(data)
length(data)
head(data)
tail(data)
data[5:9, ]
data(seq(5,9,1),)
data(-seq(5,9,1),)
names(data)

# Working w/ Variables
attach(LungCapData)
detach(LungCapData)
search()
class(LungCapData$Smoke)
as.factor(LungCapData$Smoke)
summary(LungCapData$Smoke)

c(x,y)          # From vector to one long vector
cbind(x,y)      # From vector to matrix
data.frame(x,y) # From vector to data frame
as.vector(mymatrix)     # from matrix to one long vector
as.data.frame(mymatrix) # from matrix to data frame
as.matrix(data_frame)   # from data frame to matrix

hsb2.small <- read.csv("https://stats.idre.ucla.edu/stat/data/hsb2_small.csv")
hsb3 <- hsb2.small[, c(1, 7, 8)]
hsb4 <- hsb2.small[, 1:4]
hsb5 <- hsb2.small[1:10, ]
hsb6 <- hsb2.small[hsb2.small$ses == 1, ]
hsb7 <- hsb2.small[hsb2.small$id %in% c(12, 48, 86, 11, 20, 195), ]
hsb8 <- hsb2.small[with(hsb2.small, ses == 3 & female == 0), ]
write.50 <- subset(hsb2.small, write > 50)
write.1 <- subset(hsb2.small, write > 50 & read > 60)
write.2 <- subset(hsb2.small, write > 50 & read > 60, select = c(write, read))
write.3 <- subset(hsb2.small, science < 55, select = read:science)
hsb9 <- hsb2.small[hsb2.small$ses == 3, c(1:4, 7)]

# 
mean(Age[Gender == "female"])
subset_data = LungCapData[Age > 18 & Gender == "male"]

# 
save.image("FirstProject.Rdata")
load(FirstProject.Rdata)

# Installing Packages
help(install.packages)