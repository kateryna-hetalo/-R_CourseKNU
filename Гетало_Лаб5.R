setwd("C:/Users/1/Downloads")
#setwd() - робочий каталог
source('pmean.R')

№1
pmean("specdata", "sulfate", 1:3)

pmean("specdata", "sulfate", 1:10)

pmean("specdata", "sulfate", 55)

pmean("specdata", "nitrate")

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
