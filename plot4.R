library(data.table)
fileName <- "./data/household_power_consumption.txt"
data <- fread(fileName,header=TRUE, na.strings="?",sep=";",colClasses="character")
data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
dateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
png("plot4.png")
with(data,{
     par(mfrow=c(2,2))
     plot(dateTime,data$Global_active_power,
          xlab = "",
          ylab = "Global Active Power (kilowatts)", 
          main = "",t="l")
     plot(dateTime,Voltage,t='l')
     plot(dateTime,Sub_metering_1,t='l',
          ylab="Energy sub metering", xlab="")
     lines(dateTime,Sub_metering_2,col='red')
     lines(dateTime,Sub_metering_3,col='blue')
     legend("topright",pch=1,col=c("black","red","blue"),
            legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
     plot(dateTime,Global_reactive_power,t='l')
})
dev.off()
