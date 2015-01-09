data <- read.csv(file = "household_power_consumption.txt", sep = ';', na.strings=c("?"), stringsAsFactors=FALSE)

data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"), ]

png(filename = "plot3.png", width = 480, height = 480)
plot(strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S"), 
     data$Sub_metering_1, 
     type = 'l', col = 'black', xlab = '', ylab = "Energy sub metering")
lines(strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S"), 
     data$Sub_metering_2, col = 'red')
lines(strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S"), 
     data$Sub_metering_3, col = 'blue')

legend("topright", lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"))
dev.off()

