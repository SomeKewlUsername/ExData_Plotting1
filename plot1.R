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

# reading data set
householdPowerConsumption <- fread(dataSet, sep = ";", header = TRUE, na.strings = "?")

# extracting record from 1/2/2007 to 2/2/2007
householdPowerConsumption <- householdPowerConsumption[Date %in% c("1/2/2007", "2/2/2007"), ]

# png file device
png(file="plot1.png", width = 480, height = 480)

# create histogram
hist(householdPowerConsumption$Global_active_power, col = "red", main = "Global Active Power", xlab="Global Active Power (kilowatts)", ylim = c(0, 1200))

# close png file device
dev.off()