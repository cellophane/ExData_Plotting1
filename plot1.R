library(data.table)
fileName <- "./data/household_power_consumption.txt"
data <- fread(fileName,header=TRUE, na.strings="?",sep=";",colClasses="character")
data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
data$Global_active_power <- as.numeric(data$Global_active_power)
png(filename = "plot1.png")
dateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
attach(data)
hist(Global_active_power,col='red', main= "Global Active Power", xlab = 'Global Active Power (kilowatts)')
dev.off()