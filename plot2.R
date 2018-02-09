## R code to create plot2.png

library(dplyr)
library(lubridate)

## Read file

powerData <- read.table("./household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)
powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y")

## subset data for reqd dates

reqdPowerData <- dplyr::filter(powerData, 
                              Date == as.Date("2007-02-01", "%Y-%m-%d") | 
							  Date == as.Date("2007-02-02", "%Y-%m-%d"))

## form DateTime

reqdPowerData$DateTime <- ymd_hms(paste(reqdPowerData$Date, reqdPowerData$Time))

## open device and plot graph

png(filename="plot2.png")

with(reqdPowerData, plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

## remove variables

dev.off()

## remove variables

rm(powerData)
rm(reqdPowerData)



