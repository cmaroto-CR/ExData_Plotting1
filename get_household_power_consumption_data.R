## Carlos Maroto
## Purpose:  To get the household power consumption data to use in exploratory analysis
## March 2019

# Create folder for data, if it doesn't exist
if (!file.exists("data")) {
    dir.create("data")
}

# Set file name for source data
sourcedata <- paste(getwd(), "/data/household_power_consumption.zip", sep = "")

# Check if source data has been downloaded, else get it
# For some unknown reason to me, !file.exists didn't work with the file as it did for folders
# so comparing output to TRUE instead
if (!file.exists(sourcedata)) {
    # Get data and unzip it
    message("Source data file not found, begining download...")
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", sourcedata)
    message("Source data file downloaded, begining unzip...")
    unzip(sourcedata, exdir = "./data")
    message("Source data file unzipped.")
}

