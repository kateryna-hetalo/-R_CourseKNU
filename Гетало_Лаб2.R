№1

v1 <- rnorm(100)
print(v1)
v1[10]
v1[10:20]
v1[20:(20+9)]
v1[v1 > 0]


№2

y <- data.frame(a = rnorm(100), b = 1:100, cc = sample(letters, 100, replace = TRUE))
print(y)
#sample takes a sample of the specified size from the elements of x using either with or without replacement.
tail(y, 10)
#use tail to obtain the last several rows
#obtain the first several rows of a matrix or data frame using head
y[10:20,]
y[10, 'b']
y[,'cc']
#Конструкция a[, i] выбирает данные по столбца i
#Конструкция a[i, ] выбирает данные строки i
#a[i] работает как a[, i]


№3

vector <- c(1, 2, 3, NA, 4, NA, 5, NA)
print(vector)
print(vector[!is.na(vector)])
#use the !is.na syntax to return values in R that are not NA values
print(mean(vector, na.rm = TRUE))
#rm in r refers to the logical parameter that tells the function whether or not to remove NA values from the calculation. It literally means NA remove. It is neither a function nor an operation. It is simply a parameter used by several dataframe functions.
print(mean(vector))
