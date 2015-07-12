# Load the data
hpcDataFile <- "./data/household_power_consumption.txt"
hpcData <- read.table( hpcDataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec="." )
# Subset the data to our timeframe
hpcSubSetData <- hpcData[hpcData$Date %in% c( "1/2/2007", "2/2/2007" ) ,]


# Plot the subset data
plotDateTime <- strptime( paste( hpcSubSetData$Date, hpcSubSetData$Time, sep=" " ), "%d/%m/%Y %H:%M:%S" ) 
globalActivePower <- as.numeric( hpcSubSetData$Global_active_power )
subMetering1 <- as.numeric( hpcSubSetData$Sub_metering_1 )
subMetering2 <- as.numeric( hpcSubSetData$Sub_metering_2 )
subMetering3 <- as.numeric( hpcSubSetData$Sub_metering_3 )

png( "plot3.png", width=480, height=480 )
plot( plotDateTime, subMetering1, type="l", ylab="Energy Submetering", xlab="" )
lines( plotDateTime, subMetering2, type="l", col="red" )
lines( plotDateTime, subMetering3, type="l", col="blue" )
legend( "topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue") )

# Close the file
dev.off()