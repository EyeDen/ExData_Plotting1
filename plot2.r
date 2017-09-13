setwd("D:/Coursera")

## Get data from file
data <- read.table(
  "./household_power_consumption.txt",
  header = TRUE,
  sep = ";",
  na.strings = "?"
)

## Extract only the dates we need
## and convert Date and Time to appropriate format
plotData <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

plotData$DateTime <- strptime(paste(plotData$Date,
                                    plotData$Time,
                                    sep=" "),
                              format="%d/%m/%Y %H:%M:%S")

## Write plot to .png file
png("plot2.png",
    width = 480,
    height = 480)

plot(plotData$DateTime,
     plotData$Global_active_power,
     type="l", 
     xlab="",
     ylab="Global Active Power (kilowatts)")

dev.off()
