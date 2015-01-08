# Requires the following Libraries:
#  - read.table

library(read.table)
content <- read.table ("household_power_consumption.txt", TRUE, ";", na.strings="?")
content$DateTime <- strptime (paste (content$Date, content$Time), format="%d/%m/%Y %H:%M:%S")
content <- content[content$DateTime >= "2007-02-01 00:00:00" & content$DateTime < "2007-02-03 00:00:00", 3:10] # Remove unnecessary columns and filter date

png(filename="plot1.png", width = 480, height = 480)
par(mfrow = c(1,1))
hist (content$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()