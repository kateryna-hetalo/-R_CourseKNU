�1

add2 <- function(x, y) x + y 
print(add2(pi,33))


�2

above <- function(x, n = 10) x[x > n]
vector <- c(1:123)
print(vector)
print(above(vector))


�3

my_ifelse <- function(x, exp, n)
#expression()������� � ��� R ��������������� ��� ��������� ������ � �������, ��������� �� ��������. ³� ������� �ᒺ�� ����� ������.
  {
  if (exp == '>') x[x > n]
  else if (exp == '<') x[x < n]
  else if (exp == '<=') x[x <= n]
  else if (exp == '>=') x[x >= n]
  else if (exp == '==') x[x == n]
  else x
  }

x <- c(51:101)
n <- 60
print(my_ifelse(x, '>', n))
print(my_ifelse(x, '<', n))
print(my_ifelse(x, '<=', n))
print(my_ifelse(x, '>=', n))
print(my_ifelse(x, '==', n))
print(my_ifelse(x, 'friends', n))


�4

columnmean <- function(x, removeNA = TRUE) colMeans(x, na.rm = removeNA)
columnmean(matrix(c(NA, NA, NA, 2, 13, NA, 51, 64, 267), nrow = 9, ncol = 2), TRUE)
#���� ��� �������� FALSE ������ TRUE, �� NA ������������� � ��� ����������, �� �� �� ���� �� �������� ���
#NA: �Not Available� / Missing Values