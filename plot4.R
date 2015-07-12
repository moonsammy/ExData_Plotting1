# Load the data
hpcDataFile <- "./data/household_power_consumption.txt"
hpcData <- read.table( hpcDataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec="." )
# Subset the data to our timeframe
hpchpcSubSetData <- hpcData[hpcData$Date %in% c( "1/2/2007", "2/2/2007" ) ,]

# Plot the sub-set
plotDateTime <- strptime( paste(hpcSubSetData$Date, hpcSubSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S" ) 
globalActivePower <- as.numeric( hpcSubSetData$Global_active_power )
globalReactivePower <- as.numeric( hpcSubSetData$Global_reactive_power )
voltage <- as.numeric( hpcSubSetData$Voltage )
subMetering1 <- as.numeric( hpcSubSetData$Sub_metering_1 )
subMetering2 <- as.numeric( hpcSubSetData$Sub_metering_2 )
subMetering3 <- as.numeric( hpcSubSetData$Sub_metering_3 )

png( "plot4.png", width=480, height=480 )
par( mfrow = c(2, 2) ) 
plot( plotDateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2 )
plot( plotDateTime, voltage, type="l", xlab="DateTime", ylab="Voltage" )
plot( plotDateTime, subMetering1, type="l", ylab="Energy Submetering", xlab="" )
lines( plotDateTime, subMetering2, type="l", col="red" )
lines( plotDateTime, subMetering3, type="l", col="blue" )
legend( "topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o" )

plot( plotDateTime, globalReactivePower, type="l", xlab="DateTime", ylab="Global_reactive_power" )

# Close the file
dev.off()