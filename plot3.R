setwd("/Users/sissiqin/Desktop/Rfiles")
data = read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##subset the data
subSetData <- data[data$Date %in% c("2/2/2007", "1/2/2007"), ]
head(subSetData)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
head(datetime)

## as numeric  
Sub_metering_1 <- as.numeric(subSetData$Sub_metering_1)
Sub_metering_2 <- as.numeric(subSetData$Sub_metering_2)
Sub_metering_3 <- as.numeric(subSetData$Sub_metering_3)

## plot 
png("plot3.png", width = 480, height = 480)
with(subSetData, plot(datetime, Sub_metering_1, type = "l", xlab = " ", ylab = "Energy sub metering"))
points(datetime, Sub_metering_2, col = "blue", type = "l")
points(datetime, Sub_metering_3, col = "red", type = "l")
legend("topright", lty = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
