##HOUSEHOLD POWER CONSUMPTION

data<- read.table("~/Desktop/DESKTOP/COURSES/DATA SCIENCE/4 - EXPLORATORY/COURSE PROJECTS/PROJECT 1/household_power_consumption.txt", sep = ";", skip=1, na.strings = "?")
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
needed_data <- data[data$Date == "2007-02-01"| data$Date == "2007-02-02",]
needed_data$datetime <-strptime(paste(needed_data$Date, needed_data$Time), "%Y-%m-%d %H:%M:%S")


png(file = "plot2.png", width = 480, height = 480)
plot(needed_data$datetime, needed_data$Global_active_power, type="n", bg = "transparent", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(needed_data$datetime, needed_data$Global_active_power) 
dev.off()
