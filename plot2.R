data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?",
                   colClasses=c('character', 'character', rep('numeric',7)))
filtered_data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
filtered_data$Timestamp <- with(filtered_data, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

png("plot2.png", width=480, height=480)
plot(filtered_data$Global_active_power, type = "l", lty = "solid", axes=FALSE, xlab="", ylab="Global Active Power (kilowatts)")
axis(1, at=c(0, 1440, 2880), labels=c("Thu", "Fri", "Sat"), las=1)
axis(2, at=c(0, 2, 4, 6), las=1)
box()
dev.off()