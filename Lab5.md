# Для лабораторної роботи необхідно завантажити zip файл з даними за посиланням: «https://www.dropbox.com/s/i9wi47oyhfb7qlh/rprog_data_specdata.zip?dl=0». Це файл містить 332 csv файлів, що містять у собі результати спостережень за забрудненням повітря дрібнодисперсними частками (fine particular matter air pollution) у 332 локаціях у США. Кожен файл містить дані з одного монітору. ID номер кожного монітору міститься у назві файлу. Наприклад, дані з монітору під номером 200 містяться у файлі «200.csv». Кожен файл містить три змінні: Data: дата спостереження в форматі (рік-місяць-день), sulfate: рівень сульфатних часток в повітрі на дату (мікрограми на кубічний метр) та nitrate: рівень нітратних часток в повітрі на дату (мікрограми на кубічний метр). Для цій роботи необхідно додати на Github файл pmean.R, який містить усі функції. В файлі md необхідно указати виклик функції з аргументами та вивід у консоль результатів роботи функцій.

setwd("C:/Users/1/Downloads")   
#setwd() - робочий каталог   
source('pmean.R')   
   
# №1   
'''pmean("specdata", "sulfate", 1:3)   
   
pmean("specdata", "sulfate", 1:10)   
   
pmean("specdata", "sulfate", 55   
   
pmean("specdata", "nitrate")''' 

№2
complete("specdata", 1)

complete("specdata", c(2, 4, 8, 10, 12))

complete("specdata", 50:60)

№3
cr <- corr("specdata", 150)
head(cr); summary(cr)

cr <- corr("specdata", 400)
head(cr); summary(cr)

cr <- corr("specdata", 5000)
head(cr); summary(cr) ; length(cr)
