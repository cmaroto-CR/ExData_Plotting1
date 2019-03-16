## Carlos Maroto
## Purpose:  To demonstrate the ability to plot data for exploration.
## March 2019

# Load libraries to be used
#library(plyr)
#library(readr)

# Create folder for data, if it doesn't exist
if (!file.exists("data")) {
    dir.create("data")
}

# Set file name for source data
sourcedata <- paste(getwd(), "/data/household_power_consumption.zip", sep = "")

# Check if source data has been downloaded, else get it
if (!file.exists(sourcedata)) {
    # Get data and unzip it
    source("get_household_power_consumption_data.R")
}


