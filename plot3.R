## Carlos Maroto
## Purpose:  To demonstrate the ability to plot data for exploration.
## March 2019

# Load libraries to be used
library(tidyverse)

# Create folder for data, if it doesn't exist
if (!file.exists("data")) {
    dir.create("data")
}

# Set file name for source data
input_file <- paste(getwd(), "/data/household_power_consumption_feb1_2-2017.csv", sep = "")

# Check if source data has been downloaded, else get it
if (!file.exists(input_file)) {
    # Get data and unzip it
    source("get_household_power_consumption_data.R")
}

# Load data from file
source_data <- read_csv(input_file)

# Open png device to redirect plot to
png(filename = paste(getwd(), "/data/plot3.png", sep = ""))

# Generate plot, combining date and time as a single variable for plotting each of the sub metering variables
plot(Sub_metering_1 ~ with(source_data, as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M")), data=source_data, type = "l", xlab = "", ylab = "Energy sub metering")
with(source_data, lines(Sub_metering_2 ~ as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M"), type = "l", col = "red"))
with(source_data, lines(Sub_metering_3 ~ as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M"), type = "l", col = "blue"))

# Add a legend to the plot
legend("topright", col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)

# Close device to finish working with file
dev.off()