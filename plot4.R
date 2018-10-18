library(data.table)

dataSet <- "household_power_consumption.txt"

# if data set file doesn't exist, download and unzip it
if (!file.exists(dataSet)) {
  dataSetUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  dataSetTemp <- tempfile()
  download.file(dataSetUrl, dataSetTemp)
  unzip(dataSetTemp, dataSet)
  unlink(dataSetTemp)
}