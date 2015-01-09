data <- read.csv(file = "household_power_consumption.txt", sep = ';', na.strings=c("?"), stringsAsFactors=FALSE)

data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"), ]

png(filename = "plot2.png", width = 480, height = 480)
plot(strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S"), 
     data$Global_active_power, 
     type = 'l', xlab = '', ylab = "Global Active Power (kilowatts)")
dev.off()
