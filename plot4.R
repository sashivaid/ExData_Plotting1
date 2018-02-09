## R code to create plot1.png

library(dplyr)
library(lubridate)

## Read file

powerData <- read.table("./household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)
powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y")


reqdPowerData <- dplyr::filter(powerData, 
                              Date == as.Date("2007-02-01", "%Y-%m-%d") | 
							  Date == as.Date("2007-02-02", "%Y-%m-%d"))

reqdPowerData$dateTime <- ymd_hms(paste(reqdPowerData$Date, reqdPowerData$Time))

png(filename="plot4.png")

par(mfrow = c(2,2))

with(reqdPowerData, {

plot(dateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

plot(dateTime, Voltage, type = "l")

plot(dateTime, Sub_metering_1, type="n", xlab="", ylab="")

with(reqdPowerData, lines(dateTime, Sub_metering_1))
with(reqdPowerData, lines(dateTime, Sub_metering_2, col="red"))
with(reqdPowerData, lines(dateTime, Sub_metering_3, col="blue"))
title(ylab="Energy sub metering")
legend("topright", col=c("black", "red", "blue"), 
            legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n")

plot(dateTime, Global_reactive_power, type = "l")
}
)

dev.off()

rm(powerData)
rm(reqdPowerData)