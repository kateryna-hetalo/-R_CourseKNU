№1

character <- 'friends'
print(class(character))
numeric <- pi
class(numeric)
integer <- 2L
# L вказує що це ціле число
print(class(integer))
complex <- (1+5i)
print(class(complex))
logical <- FALSE
print(class(logical))

№2
vector1 <- c(5:75)
print(vector1)
vector2 <- c(pi, 2.71, 0, 13)
print(vector2)
vector3 <- rep(TRUE, 100)
#rep() - ітерація, повторення
print(vector3)

№3
M <- matrix(c(0.5, 3.9, 0, 2, 1.3, 131, 2.2, 7, 3.5, 2.8, 4.6, 5.1), nrow = 4, ncol = 3)
#nrow - рядки, ncol - стовпці
m1 <- cbind(c(0.5, 3.9, 0, 2), c(1.3, 131, 2.2, 7), c(3.5, 2.8, 4.6, 5.1))
print(m1)
m2 <-rbind(c(0.5,1.3, 3.5), c(3.9, 131, 2.8), c(0, 2.2, 4.6), c(2, 7, 5.1))
print(m2)
# cbind або rbind залежить від того, за стовпцями чи за рядками буде створено

№4
basic_list <- list(11, 10L, TRUE, 2 + 14i, "Ross")
print(basic_list)
# list може вміщати в собі різні типи даних одночасно

№5
x <- factor(c("adult", "baby", "child", "adult", "adult", "child", "child", "baby", "baby"), levels = c("baby", "child", "adult"))
print(x)

№6
a <- c(1, 2, 3, 4, NA, 6, 7, NA, 9, NA, 11)
match(NA, a)
x <- min(which(is.na(a)))
print(x)
y <- length(which(is.na(a)))
print(y)
# Using is.na R to check for NA in R 
# Logic, which.min для індексу мінімуму або максимуму, match також для першого індексу елемента у векторі, тобто для скаляра a, match(a, x) еквівалентно, min(which(x == a))але набагато ефективніше.

№7
# Дата фрейм використовується для зберігання таблиць даних. Це список векторів однакової довжини
friends_dataframe <- data.frame(d1 = c(1:6), d2 = c('Joey','Phoebe', 'Ross', 'Monica', 'Chandler', 'Rachel'), d3 = c(TRUE, FALSE, TRUE, TRUE, FALSE, FALSE))
print(friends_dataframe)

№8
names(friends_dataframe) <- c('Numbers', 'Characters', 'Logicals')
print(friends_dataframe)
