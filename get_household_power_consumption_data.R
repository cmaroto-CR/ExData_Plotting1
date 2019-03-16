## Carlos Maroto
## Purpose:  To get the household power consumption data to use in exploratory analysis
## March 2019

# Create folder for data, if it doesn't exist
if (!file.exists("data")) {
    dir.create("data")
}

# Set file name for source data
all_data <- paste(getwd(), "/data/household_power_consumption.zip", sep = "")

# Check if source data has been downloaded, else get it
# For some unknown reason to me, !file.exists didn't work with the file as it did for folders
# so comparing output to TRUE instead
if (!file.exists(all_data)) {
    # Get data and unzip it
    message("Source data file not found, begining download...")
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", all_data)
    message("Source data file downloaded, begining unzip...")
    unzip(all_data, exdir = "./data")
    message("Source data file unzipped.")
}

# Set file name for source data
source_file <- paste(getwd(), "/data/household_power_consumption.txt", sep = "")

# Read all data from file, added vector for na which includes "?" known to be used
# in this data set for missing data
all_data <- read_delim(file = source_file, delim = ";", na = c("", "NA", "?"))
# Change the type of the Date variable from character to date 
all_data$Date <- as.Date(all_data$Date, format = "%d/%m/%Y")

# Limit data to Feb 1st and 2nd of 2017, since those are the only days needed for analysis
all_data <- all_data %>%  filter(Date >= as.Date('2007-02-01') & Date <= as.Date('2007-02-02'))

# Write the two days filtered data to be used for plotting in other scripts
write_csv(all_data, path = paste(getwd(), "/data/household_power_consumption_feb1_2-2017.csv", sep = ""))