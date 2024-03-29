

read_files <- function(directory, id=1:332) {
  files <- list.files(directory, full.names=T)[id]
  data_list <- lapply(files, read.csv)
  
  return (data_list)
}

pmean <- function(directory, pollutant, id=1:332) {
  data_list <- read_files(directory, id)
  
  # pmean �������� ������� �������� ������ ������ �� ���� ��� �������� �������
  # 'data_list' - �� ������, ���� ������ data.frames � ��� ���������� �����, ��� �� ��'������ ������ � ���������� � ���� ������� ���������
 
  data <- do.call(rbind, data_list)
  # do.call ��������� �� ������ ������ ������� � ����� �� ������� �� ������ ���������, �� ������� ��������.
  # rbind , ���������� �� row-bind , ���� ����������������� ��� �������� �������, ������� � ����� ����� �� �������.
  
  # mean �������� ������� ��������
  # �������� NA ��������
  result <- mean(data[,pollutant], na.rm = TRUE)
  return (result)
}

complete <- function(directory, id) {
  data_list <- read_files(directory, id)
  
  # complete - �������� ������� ������ ������������
  # sapply functions acts like lapply but returns a vector
  # nobs - ������� ������������, �� �� ���������
  nobs <- sapply(data_list, function(x) { sum(complete.cases(x)) })
  
  result <- data.frame(id, nobs)
  
  return (result)
}

corr <- function(directory, threshold = 0) {
  data_list <- read_files(directory)
  
  # ����������� ������ ����������, ��� ���� ���� ���� ����� �������
  data_list <- lapply(data_list, function(x) { x[complete.cases(x),] })
  
  # ���������� ������ 'data_list', ��� �� ���� ���� ������ ����������, � ���� ������� ������ ������������ �������� �������� threshold
    filtered_list <- Filter(function(x) { nrow(x) > threshold }, data_list)
  
  # ��������� �������� ������, ���� filtered_list ��������
  # (���� ���� ��������, �� ����� ������� ������ ������������ > threshold ��������)
  if (length(filtered_list) == 0) {
    return (c())
  }
  
  # �������� ������ ��������� �������� � ������� ��� ������� ��������
  cors <- sapply(filtered_list, function(x) { cor(x[,'sulfate'], x[,'nitrate']) })
  return (cors)
  
}
