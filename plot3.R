## R code to create plot3.png

library(dplyr)
library(lubridate)

## Read file

powerData <- read.table("./household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)
powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y")

## subset data for reqd dates

reqdPowerData <- dplyr::filter(powerData, 
                              Date == as.Date("2007-02-01", "%Y-%m-%d") | 
							  Date == as.Date("2007-02-02", "%Y-%m-%d"))

## form Date Time

reqdPowerData$DateTime <- ymd_hms(paste(reqdPowerData$Date, reqdPowerData$Time))

## open device and plot graph

png(filename="plot3.png")

with(reqdPowerData, plot(DateTime, Sub_metering_1, type="n", xlab="", ylab=""))

with(reqdPowerData, lines(DateTime, Sub_metering_1))
with(reqdPowerData, lines(DateTime, Sub_metering_2, col="red"))
with(reqdPowerData, lines(DateTime, Sub_metering_3, col="blue"))
title(ylab="Energy sub metering")
legend("topright", col=c("black", "red", "blue"), 
            legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)

## remove variables

dev.off()

## remove variables

rm(powerData)
rm(reqdPowerData)