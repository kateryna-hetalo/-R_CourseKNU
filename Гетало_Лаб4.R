file = read.csv("C:/Users/1/Downloads/hw1_data.csv")
print(file)


№1
colnames(file)
#colnames() method in R is also used to rename 


№2
head(file, 6)
#Returns the first or last parts of a vector, matrix, table, data frame or function. Since head() and tail() are generic functions, they may also have been extended to other classes.


№3
nrow(file)


№4
tail(file, 10)


№5
sum(is.na(file$'Ozone'))


№6
mean(file$Ozone[!is.na(file$Ozone)])


№7
subset = subset(file, (file$Ozone > 31) & (file$Temp > 90))
print(subset)
#subset повертає підмножини векторів, матриць або кадрів даних, які відповідають умовам.
mean(subset$Solar.R)


№8
mean(subset(file, (file$Month == 6))$Temp)
#або
subset = subset(file, (file$Month == 6) & (file$Temp))
print(subset)
mean(subset$Temp)


№9
max(subset(file, (file$Month == 5))$Ozone, na.rm = TRUE)
#When na.rm is TRUE, the function skips over any NA values. 
#However, when na.rm is FALSE, then it returns NA from the calculation being done on the entire row or column.
