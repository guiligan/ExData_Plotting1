# Requires the following Libraries:
#  - read.table

library(read.table)
content <- read.table ("household_power_consumption.txt", TRUE, ";", na.strings="?")
content$DateTime <- strptime (paste (content$Date, content$Time), format="%d/%m/%Y %H:%M:%S")
content <- content[content$DateTime >= "2007-02-01 00:00:00" & content$DateTime < "2007-02-03 00:00:00", 3:10] # Remove unnecessary columns and filter date

png(filename="plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot (content$DateTime, content$Global_active_power, type="l", main="", xlab="", ylab="Global Active Power")
plot (content$DateTime, content$Voltage, type="l", main="", xlab="datetime", ylab="Voltage")
plot (content$DateTime, content$Sub_metering_1, type="l", main="", xlab="", ylab="Energy sub metering", col="black")
points(content$DateTime, type="l", content$Sub_metering_2, col="red")
points(content$DateTime, type="l", content$Sub_metering_3, col="blue")
legend ("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black","red","blue"), cex=0.9, bty="n")
plot (content$DateTime, content$Global_reactive_power, type="l", main="", xlab="datetime", ylab="Global_reactive_power")
dev.off()