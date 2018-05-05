# Course Project 1 - Exploratory data analysis
# Author: Thiago M.
# Plot 1

# Reading the data:
setwd("~/Documents/R/Coursera")
data <- read.table("household_power_consumption.txt", sep=";", header = TRUE)

# Subseting the data from the dates 2007-02-01 and 2007-02-02
datasub <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Creating the histogram
# Converting to numeric columns 3 to 9
for (i in 3:9) {
    datasub[,i] <- as.numeric(as.character(datasub[,i]))
}
# Creating the png file
png(file="plot1.png", width = 480, height = 480)
# Creating the histogram
hist(datasub$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
# Closing the graphics device
dev.off()