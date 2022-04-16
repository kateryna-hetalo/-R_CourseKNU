# №1 Створить вектор v із 100 елементів командою v <- rnorm(100). Для цього вектору виведіть: 10-й елемент; елементи з 10-го по 20-й включно; 10 елементів починаючи з 20-го; елементи більше 0.   

v1 <- rnorm(100)   
print(v1)   
v1[10]   
v1[10:20]   
v1[20:(20+9)]   
v1[v1 > 0]   


# №2 Створити фрейм (data frame) y командою y <- data.frame(a = rnorm(100), b = 1:100, cc = sample(letters, 100, replace = TRUE)). Для цього data frame виведіть: останні 10 строк; строки з 10 по 20 включно; 10-й елемент стовпця b; повністю стовпець cc, при цьому використайте ім’я стовпця.   

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


# №3 Створити вектор z з елементами 1, 2, 3, NA, 4, NA, 5, NA. Для цього вектору: виведіть всі елементи, які не NA; підрахуйте середнє значення всіх елементів цього вектору без NA значень та з NA значеннями.   


vector <- c(1, 2, 3, NA, 4, NA, 5, NA)   
print(vector)   
print(vector[!is.na(vector)])   
#use the !is.na syntax to return values in R that are not NA values   
print(mean(vector, na.rm = TRUE))   
#rm in r refers to the logical parameter that tells the function whether or not to remove NA values from the calculation. It literally means NA remove. It is neither a function nor an operation. It is simply a parameter used by several dataframe functions.   
print(mean(vector))   
