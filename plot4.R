data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?",
                   colClasses=c('character', 'character', rep('numeric',7)))
filtered_data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
filtered_data$Timestamp <- with(filtered_data, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))

plot(filtered_data$Global_active_power, type = "l", lty = "solid", axes=FALSE, xlab="", ylab="Global Active Power")
axis(1, at=c(0, 1440, 2880), labels=c("Thu", "Fri", "Sat"), las=1)
axis(2, at=c(0, 2, 4, 6), las=1)
box()

plot(filtered_data$Voltage, type = "l", lty = "solid", axes=FALSE, xlab="datetime", ylab="Voltage")
axis(1, at=c(0, 1440, 2880), labels=c("Thu", "Fri", "Sat"), las=1)
axis(2, at=seq(234, 246, by = 2), labels=c("234", "", "238", "", "242", "", "246"), las=1)
box()

plot(filtered_data$Sub_metering_1, type = "l", lty = "solid", axes=FALSE, xlab="", ylab="Energy sub metering")
lines(filtered_data$Sub_metering_2, type = "l", lty = "solid", col = "red")
lines(filtered_data$Sub_metering_3, type = "l", lty = "solid", col = "blue")
axis(1, at=c(0, 1440, 2880), labels=c("Thu", "Fri", "Sat"), las=1)
axis(2, at=c(0, 10, 20, 30), las=1)
legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1,1,1), box.lwd = 0)
box()

plot(filtered_data$Global_reactive_power, type = "l", lty = "solid", axes=FALSE, xlab="datetime", ylab="Global_reactive_power")
axis(1, at=c(0, 1440, 2880), labels=c("Thu", "Fri", "Sat"), las=1)
axis(2, at=seq(0, 0.5, by = .1), las=1)
box()

dev.off()