## R code to create plot1.png

library(dplyr)
library(lubridate)

## Read file

powerData <- read.table("./household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)
powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y")


reqdPowerData <- dplyr::filter(powerData, 
                              Date == as.Date("2007-02-01", "%Y-%m-%d") | 
							  Date == as.Date("2007-02-02", "%Y-%m-%d"))

reqdPowerData$DateTime <- ymd_hms(paste(reqdPowerData$Date, reqdPowerData$Time))

png(filename="plot2.png")

with(reqdPowerData, plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

dev.off()

rm(powerData)
rm(reqdPowerData)



