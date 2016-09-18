setwd("/Users/sissiqin/Desktop/Rfiles")
data = read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##subset the data
subSetData <- data[data$Date %in% c("2/2/2007", "1/2/2007"), ]
head(subSetData)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
head(datetime)

## as numeric 
GlobalActivePower <- as.numeric(subSetData$Global_active_power)
Sub_metering_1 <- as.numeric(subSetData$Sub_metering_1)
Sub_metering_2 <- as.numeric(subSetData$Sub_metering_2)
Sub_metering_3 <- as.numeric(subSetData$Sub_metering_3)
Voltage <- as.numeric(subSetData$Voltage)
Global_reactive_power <- as.numeric(subSetData$Global_reactive_power)

## let's rock 
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2), mar = c(4, 4, 2, 2))

## plot 1
with(subSetData, plot(datetime, GlobalActivePower, type = "l", xlab = " ", ylab = "Global Active Power(killowatts)"))

## plot 2 
with(subSetData, plot(datetime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

## plot 3 

with(subSetData, plot(datetime, Sub_metering_1, type = "l", xlab = " ", ylab = "Energy sub metering"))
points(datetime, Sub_metering_2, col = "blue", type = "l")
points(datetime, Sub_metering_3, col = "red", type = "l")
legend("topright", lty = 1, col = c("black", "blue", "red"), lwd=2.5, bty ="o", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## plot 4
with(subSetData, plot(datetime, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))
dev.off()
