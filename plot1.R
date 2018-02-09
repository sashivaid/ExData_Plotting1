## R code to create plot1.png

library(dplyr)

## Read file


powerData <- read.table("./household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)
powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y")

reqdPowerData <- dplyr::filter(powerData, 
                              Date == as.Date("2007-02-01", "%Y-%m-%d") | 
							  Date == as.Date("2007-02-02", "%Y-%m-%d"))

png(filename="plot1.png")
hist(reqdPowerData$Global_active_power, xlab = "Global Active Power (kilowatts)", main="Global Active Power", col="red")
dev.off()

rm(powerData)
rm(reqdPowerData)



