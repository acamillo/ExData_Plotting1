##
## This function is used by all the plotXYZ.R functions to load the database
##
## We make use of the readr and dplyr packages as highlighted by the book
## R Programming at pages 27 and 49
##
## 1. The function verify first is the database has already been downloaded
##    and unzipped in the current working directory. If not it downloads it
##    from the provided URL and unzipp it
## 2. Open and load the database
## 3. Mutate the data field into a Date format field
## 4. Subset the dateset to ibclude only the data relevant for the assignment
##    namely the rows between the 01/02/2007 and 02/02/2007
## 5. Mutate the subset adding a Timestamp field combining the Data and 
##    Time field


library(dplyr)
library(readr)

loadPowerConsumptionData <- function() {
    
    ## URL of the database. Provided by the assignment
    url  <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    
    ## Database file name
    fileName <- "household_power_consumption.txt"

    if(!file.exists(fileName)) {    
        message("Downloading database...")
        temp <- tempfile()
        download.file(url, temp)
        
        message("Unzipping  database...")
        
        file <- unzip(temp)
        unlink(temp)
    }
    
    message("Loading data...")
    suppressWarnings( power_data <- read_csv2(fileName, col_type="ccnnnnnnn") )

    message("Correcting  data...")
    power_data <- mutate(power_data, 
                        Date=as.Date(power_data$Date, format ="%d/%m/%Y"))
    
    ## Subset the main power databased
    sub_set <- filter(power_data, Date == "2007-02-01" | Date == "2007-02-02")
    
    ## Add a Timestampa field to the data frame
    sub_set <- mutate(sub_set, Timestamp = as.POSIXct(paste(Date, Time)))
    
##    sub_set$Timestamp <- strptime(paste(sub_set$Date, sub_set$Time), "%d/%m/%Y %H:%M:%S")

}