setwd("/Users/sissiqin/Desktop/Rfiles")
data = read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##subset the data
subSetData <- data[data$Date %in% c("2/2/2007", "1/2/2007"), ]
GlobalActivePower <- as.numeric(subSetData$Global_active_power)

##do the first graphic 
png("plot1.png", width = 480, height = 480)
hist(GlobalActivePower, main = "Global Active Power", col = "red", xlab = "Global Active Power(killowatts)")
dev.off()
