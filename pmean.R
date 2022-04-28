

read_files <- function(directory, id=1:332) {
  files <- list.files(directory, full.names=T)[id]
  data_list <- lapply(files, read.csv)
  
  return (data_list)
}

pmean <- function(directory, pollutant, id=1:332) {
  data_list <- read_files(directory, id)
  
  # pmean Обчислює середнє значення змінних умовно до часу або окремого індексу
  # 'data_list' - це список, який містить data.frames з усіх необхідних файлів, так ми об'єднаємо список з датафреймів в один великий датафрейм
 
  data <- do.call(rbind, data_list)
  # do.call конструює та виконує виклик функції з імені чи функції та списку аргументів, які потрібно передати.
  # rbind , скорочення від row-bind , може використовуватися для поєднання векторів, матриць і кадрів даних за рядками.
  
  # mean обчислює середнє значення
  # ігноруємо NA значення
  result <- mean(data[,pollutant], na.rm = TRUE)
  return (result)
}

complete <- function(directory, id) {
  data_list <- read_files(directory, id)
  
  # complete - виводить кількість повних спостережень
  # sapply functions acts like lapply but returns a vector
  # nobs - кількість спостережень, які не пропущені
  nobs <- sapply(data_list, function(x) { sum(complete.cases(x)) })
  
  result <- data.frame(id, nobs)
  
  return (result)
}

corr <- function(directory, threshold = 0) {
  data_list <- read_files(directory)
  
  # переформуємо список датафреймів, щоб вони мали лише повні регістри
  data_list <- lapply(data_list, function(x) { x[complete.cases(x),] })
  
  # відфільтрємо список 'data_list', щоб ми мали лише список датафреймів, у яких кількість повних спостережень перевищує значення threshold
    filtered_list <- Filter(function(x) { nrow(x) > threshold }, data_list)
  
  # повернемо порожній вектор, якщо filtered_list порожній
  # (якщо немає моніторів, які мають кількість повних спостережень > threshold значення)
  if (length(filtered_list) == 0) {
    return (c())
  }
  
  # отримаємо вектор кореляції сульфатів і нітратів для кожного монітора
  cors <- sapply(filtered_list, function(x) { cor(x[,'sulfate'], x[,'nitrate']) })
  return (cors)
  
}
