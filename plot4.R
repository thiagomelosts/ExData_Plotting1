# Course Project 1 - Exploratory data analysis
# Author: Thiago M.
# Plot 4

# Reading the data:
setwd("~/Documents/R/Coursera")
data <- read.table("household_power_consumption.txt", sep=";", header = TRUE)

# Subseting the data from the dates 2007-02-01 and 2007-02-02
datasub <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Converting Date and Time to date-time format:
datasub$date <- paste(datasub$Date, datasub$Time, sep = " ")
datasub$date <- strptime(datasub$date, format="%d/%m/%Y %H:%M:%S")

# Creating the plot
# Converting to numeric columns 3 to 9
for (i in 3:9) {
    datasub[,i] <- as.numeric(as.character(datasub[,i]))
}
# Creating the png file
png(file="plot4.png", width = 480, height = 480)
# Creating the plots
par(mfcol = c(2,2))

# First plot
with(datasub, plot(date, Global_active_power, type = "l", xlab = "",
                   ylab = "Global Active Power (kilowatts)"))

# Second plot
with(datasub, plot(date, Sub_metering_1, type = "l", xlab = "", 
                   ylab = "Energy sub metering"))
with(datasub, lines(date, Sub_metering_2, col = "red"))
with(datasub, lines(date, Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2",
                              "Sub_metering_3"), lty = c(1,1,1),
       col = c("black", "red", "blue"), bty = "n")

# Third plot
with(datasub, plot(date, Voltage, type = "l", xlab = "datetime"))

# Fourth plot
with(datasub, plot(date, Global_reactive_power, type = "l", xlab = "datetime"))

# Closing the graphics device
dev.off()