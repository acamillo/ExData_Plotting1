##
## This function is used to produce the plot3
##
## 1. We make use of the general purpose loadPowerConsumptionData to create
##    a data frame  (called "data") according to the problem specification
## 2. Create the histogram with the proper data
## 3. Store the plot into a file
## 4. Print a message

source("loadPowerConsumptionData.R")
data <- loadPowerConsumptionData()

# Produce the plot
plot(data$Timestamp, data$Sub_metering_1, type="l", 
     xlab="", ylab="Energy sub metering")

# Add the decorations
lines(data$Timestamp,data$Sub_metering_2,col="red")
lines(data$Timestamp,data$Sub_metering_3,col="blue")

legend("topright", col=c("black","red","blue"), 
       c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),
       lty=c(1,1), lwd=c(1,1))

# Produce the output plot file
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
cat("plot3.png saved in", getwd())