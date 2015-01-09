data <- read.csv(file = "household_power_consumption.txt", sep = ';', na.strings=c("?"), stringsAsFactors=FALSE)

data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"), ]

png(filename = "plot4.png", width = 480, height = 480)

# top left
par(mfcol = c(2, 2))
plot(strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S"), 
     data$Global_active_power, 
     type = 'l', xlab = '', ylab = "Global Active Power (kilowatts)")

# bottom left
plot(strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S"), 
     data$Sub_metering_1, 
     type = 'l', col = 'black', xlab = '', ylab = "Energy sub metering")
lines(strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S"), 
      data$Sub_metering_2, col = 'red')
lines(strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S"), 
      data$Sub_metering_3, col = 'blue')
legend("topright", lty = 1, box.lwd = 0, cex = 0.9, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"))

# top right
plot(strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S"), 
     data$Voltage, 
     type = 'l', xlab = 'datetime', ylab = "Voltage")

# bottom right
plot(strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S"), 
     data$Global_reactive_power, 
     type = 'l', xlab = 'datetime', ylab = "Global_reactive_power")

dev.off()
