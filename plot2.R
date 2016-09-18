setwd("/Users/sissiqin/Desktop/Rfiles")
data = read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##subset the data
subSetData <- data[data$Date %in% c("2/2/2007", "1/2/2007"), ]
head(subSetData)
GlobalActivePower <- as.numeric(subSetData$Global_active_power)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
head(datetime)

##plot
png("plot2.png", width = 480, height = 480)
with(subSetData, plot(datetime, GlobalActivePower, type = "l", xlab = " ", ylab = "Global Active Power(killowatts)"))
dev.off()
