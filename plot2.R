# Course Project 1 - Exploratory data analysis
# Author: Thiago M.
# Plot 2

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
png(file="plot2.png", width = 480, height = 480)
# Creating the plot
with(datasub, plot(date, Global_active_power, type = "l", xlab = "",
                   ylab = "Global Active Power (kilowatts)"))
# Closing the graphics device
dev.off()