#Setting working directory
setwd("D:/Courses/Data_Science/John_Hopkins_Specialization/Course4-EDA")

# Load the necessary library
library(data.table)

# Load only the data for the required dates
data <- fread("household_power_consumption.txt", na.strings = "?")
data <- data[Date == "1/2/2007" | Date == "2/2/2007"]

# Combine Date and Time columns
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%Y/%m/%d %H:%M:%S")

# Plot 3
png("plot3.png", width = 480, height = 480)
plot(data$DateTime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)
dev.off()
