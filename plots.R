## Reading and subsetting data
all_power <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
all_power$DateTime <- paste(all_power$Date, all_power$Time)
all_power$DateTime <- strptime(all_power$DateTime, "%d/%m/%Y %H:%M:%S") ## transferring from Factor via chr to DateTime
start <- which(all_power$DateTime == strptime("2007-02-01", "%Y-%m-%d"))
end <- which(all_power$DateTime == strptime("2007-02-02 23:59:00", "%Y-%m-%d %H:%M:%S"))
feb07_power <- all_power[start:end,] # subsetting from start to end point

## Constructing Histogram 
hist(feb07_power$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(device = png, file = "plot1.png", width = 480, height = 480)
dev.off()


##  Constructing Plot2 
plot(feb07_power$DateTime, feb07_power$Global_active_power, type = 'l', ylab = "Global Active Power (Kilowatts)", xlab = "")
dev.copy(device = png, file = "plot2.png", width = 480, height = 480)
dev.off()

## Constructing Plot3 with legend
plot(feb07_power$DateTime, feb07_power$Sub_metering_1, type = 'l', ylab = "Energy sub metering", xlab ="")
lines(feb07_power$DateTime, feb07_power$Sub_metering_2, type = 'l', col = "red")
lines(feb07_power$DateTime, feb07_power$Sub_metering_3, type = 'l', col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"))
dev.copy(device = png, file = "plot3.png", width = 480, height = 480)
dev.off()

## Constructing Plot4 
par(mfcol = c(2,2))
## same as plot2 but ylab's shorter
plot(feb07_power$DateTime, feb07_power$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
## same as plot3 but legend's no border
plot(feb07_power$DateTime, feb07_power$Sub_metering_1, type = 'l', ylab = "Energy sub metering", xlab ="")
lines(feb07_power$DateTime, feb07_power$Sub_metering_2, type = 'l', col = "red")
lines(feb07_power$DateTime, feb07_power$Sub_metering_3, type = 'l', col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"), bty = "n")
## Voltage plot
plot(feb07_power$DateTime, feb07_power$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
## Global reactive power plot
plot(feb07_power$DateTime, feb07_power$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
## Saving all in a file
dev.copy(device = png, file = "plot4.png", width = 480, height = 480)
dev.off()