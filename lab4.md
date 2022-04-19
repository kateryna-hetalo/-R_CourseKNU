# Для лабораторної роботи необхідно завантажити файл з даними за посиланням: «https://www.dropbox.com/s/8k1gjgk8cflmpb6/hw1_data.csv?dl=0». В RStudio файл необхідно прочитати за допомогою команди read.csv.   

file = read.csv("C:/Users/1/Downloads/hw1_data.csv")   
print(file)   


# №1 Які назви стовпців файлу даних?   
colnames(file)   
#colnames() method in R is also used to rename   


# №2 Виведіть перші 6 строк фрейму даних.   
head(file, 6)   
#Returns the first or last parts of a vector, matrix, table, data frame or function. Since head() and tail() are generic functions, they may also have been extended to other classes.   


# №3 Скільки спостерігань (строк) в дата фреймі?   
nrow(file)   


# №4 Виведіть останні 10 строк дата фрейму.   
tail(file, 10)   


# №5 Як багато значень «NA» в стовпці «Ozone»   
sum(is.na(file$'Ozone'))   


# №6 Яке середнє (mean) стовпця «Ozone». Виключити «NA» значення.   
mean(file$Ozone[!is.na(file$Ozone)])   


# №7 Виведіть частину набору даних (subset) зі значенням «Ozone» > 31 та «Temp» > 90. Яке середнє (mean) значень «Solar.R» в цьому наборі даних (subset)?   
subset = subset(file, (file$Ozone > 31) & (file$Temp > 90))   
print(subset)   
#subset повертає підмножини векторів, матриць або кадрів даних, які відповідають умовам.   
mean(subset$Solar.R)   


# №8 Яке середнє значення (mean) для «Temp» для червня («Month» дорівнює 6)?   
mean(subset(file, (file$Month == 6))$Temp)   
#або   
subset = subset(file, (file$Month == 6) & (file$Temp))   
print(subset)   
mean(subset$Temp)   


# №9 Яке максимальне значення «Ozone» для травня («Month» дорівнює 5)?   
max(subset(file, (file$Month == 5))$Ozone, na.rm = TRUE)   
#When na.rm is TRUE, the function skips over any NA values.    
#However, when na.rm is FALSE, then it returns NA from the calculation being done on the entire row or column.   
