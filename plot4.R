##
## This function is used to produce the plot1
##
## 1. We make use of the general purpose loadPowerConsumptionData to create
##    a data frame  (called "data") according to the problem specification
## 2. Create the histogram with the proper data
## 3. Store the plot into a file
## 4. Print a message

source("loadPowerConsumptionData.R")
data <- loadPowerConsumptionData()


## Prepare the screen for a  2 x 2 matrix panel
par(mfrow=c(2,2))

## Generate plot #1 
plot(data$Timestamp,data$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power")

## Generate plot #2
plot(data$Timestamp,data$Voltage, type="l", xlab="datetime", ylab="Voltage")

## Generate plot #3
plot(data$Timestamp,data$Sub_metering_1, type="l", 
     xlab="", ylab="Energy sub metering")

## Add decorations
lines(data$Timestamp,data$Sub_metering_2,col="red")
lines(data$Timestamp,data$Sub_metering_3,col="blue")

## Add the plot legend
legend("topright", col=c("black","red","blue"), 
       c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),
       lty=c(1,1), bty="n", cex=.5) 

## Generate plot #4
plot(data$Timestamp,data$Global_reactive_power, type="l", 
     xlab="datetime", ylab="Global_reactive_power")

# Produce the output file
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
cat("plot4.png saved in", getwd())