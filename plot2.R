##
## This function is used to produce the plot2
##
## 1. We make use of the general purpose loadPowerConsumptionData to create
##    a data frame  (called "data") according to the problem specification
## 2. Create the histogram with the proper data
## 3. Store the plot into a file
## 4. Print a message

source("loadPowerConsumptionData.R")
data <- loadPowerConsumptionData()

# Produce the plot
plot(data$Timestamp,data$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")

# Produce the plot output file
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
cat("plot2.png saved in", getwd())