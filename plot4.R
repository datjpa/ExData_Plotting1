##HOUSEHOLD POWER CONSUMPTION

data<- read.table("~/Desktop/DESKTOP/COURSES/DATA SCIENCE/4 - EXPLORATORY/COURSE PROJECTS/PROJECT 1/household_power_consumption.txt", sep = ";", skip=1, na.strings = "?")
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
needed_data <- data[data$Date == "2007-02-01"| data$Date == "2007-02-02",]
needed_data$datetime <-strptime(paste(needed_data$Date, needed_data$Time), "%Y-%m-%d %H:%M:%S")

png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(needed_data,{
        plot(needed_data$datetime, needed_data$Global_active_power, type="n", xlab = "", ylab = "Global Active Power")
                lines(needed_data$datetime, needed_data$Global_active_power)
        plot(needed_data$datetime, needed_data$Voltage, type="n", xlab = "datetime", ylab = "Voltage")
                lines(needed_data$datetime, needed_data$Voltage)
        plot(needed_data$datetime, needed_data$Sub_metering_1, type="n", xlab = "", ylab = "Energy sub Metering")
                 lines(needed_data$datetime, needed_data$Sub_metering_1)
                 lines(needed_data$datetime, needed_data$Sub_metering_2, col = "red")
                 lines(needed_data$datetime, needed_data$Sub_metering_3, col = "blue")
                 legend("topright", lty=c(1,1), col = c("black", "red", "blue"), bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=1)
        plot(needed_data$datetime, needed_data$Global_reactive_power, type="n", xlab = "datetime", ylab = "Global_reactive_power")
                lines(needed_data$datetime, needed_data$Global_reactive_power)
        
})
dev.off()
