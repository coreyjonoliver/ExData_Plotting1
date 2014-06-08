data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?",
                   colClasses=c('character', 'character', rep('numeric',7)))
filtered_data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
filtered_data$Timestamp <- with(filtered_data, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

png("plot1.png", width=480, height=480)
hist(filtered_data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", xlim=c(0,8), ylim=c(0,1200), col=c("red"), axes=FALSE)
axis(1, at = seq(0, 6, by = 2), las=1)
axis(2, at = seq(0, 1200, by = 200), las=1)
dev.off()