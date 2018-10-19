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
powerConsumption <- fread(dataSet, sep = ";", header = TRUE, na.strings = "?", data.table = FALSE)

# extracting record from 1/2/2007 to 2/2/2007
powerConsumption <- subset(powerConsumption, 
                         Date %in% c("1/2/2007", "2/2/2007"))


# Create Datetime from Posixlt combing Date and Time
powerConsumption$datetime <- strptime(paste(powerConsumption$Date, powerConsumption$Time), 
                                    "%d/%m/%Y %H:%M:%S")


# png file device
png(file="plot2.png", width = 480, height = 480)

# create plot
with(powerConsumption, plot(datetime, Global_active_power, type = "l", 
                          xlab = "", ylab = "Global Active Power (kilowatts)"))

# close png file device
dev.off()