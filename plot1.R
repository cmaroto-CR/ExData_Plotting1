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
png(filename = paste(getwd(), "/data/plot1.png", sep = ""))

# Generate plot
hist(source_data$Global_active_power, freq = TRUE, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")

# Close device to finish working with file
dev.off()