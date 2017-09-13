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
png("plot4.png",
    width = 480,
    height = 480)

par(mfrow=c(2, 2))

plot(plotData$DateTime,
     plotData$Global_active_power,
     type="l", 
     xlab="",
     ylab="Global Active Power")

plot(plotData$DateTime,
     plotData$Voltage,
     type="l", 
     xlab="datetime",
     ylab="Voltage")

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
       bty="n",
       lty=1,
       col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(plotData$DateTime,
     plotData$Global_reactive_power,
     type="l", 
     xlab="datetime",
     ylab="Global_reactive_Power")

dev.off()