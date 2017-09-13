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
png("plot3.png",
    width = 480,
    height = 480)

plot(plotData$DateTime,
     plotData$Sub_metering_1,
     type="l", 
     xlab="",
     ylab="Energy sub metering")

lines(plotData$DateTime,
      plotData$Sub_metering_2,
      col="red")

lines(plotData$DateTime,
      plotData$Sub_metering_3,
      col="blue")

legend("topright",
       col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1)

dev.off()