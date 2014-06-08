data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?",
                   colClasses=c('character', 'character', rep('numeric',7)))
filtered_data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
filtered_data$Timestamp <- with(filtered_data, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

png("plot3.png", width=480, height=480)
plot(filtered_data$Sub_metering_1, type = "l", lty = "solid", axes=FALSE, xlab="", ylab="Energy sub metering")
lines(filtered_data$Sub_metering_2, type = "l", lty = "solid", col = "red")
lines(filtered_data$Sub_metering_3, type = "l", lty = "solid", col = "blue")
axis(1, at=c(0, 1440, 2880), labels=c("Thu", "Fri", "Sat"), las=1)
axis(2, at=c(0, 10, 20, 30), las=1)
legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1,1,1))
box()
dev.off()