setwd("D:/Coursera")

## Get data from file
data <- read.table(
  "./household_power_consumption.txt",
  header = TRUE,
  sep = ";",
  na.strings = "?"
)

## Extract only the dates we need
plotData <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

## Write plot to .png file
png("plot1.png",
    width = 480,
    height = 480)

hist(plotData$Global_active_power,
     main = "Global Active Power",
     col = "red",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")

dev.off()


