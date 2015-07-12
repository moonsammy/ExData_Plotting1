# Load the data
hpcDataFile <- "./data/household_power_consumption.txt"
hpcData <- read.table( hpcDataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec="." )
# Subset the data to our timeframe
hpcSubSetData <- hpcData[hpcData$Date %in% c( "1/2/2007", "2/2/2007" ) ,]

# Plot the sub-set data
plotDateTime <- strptime( paste( hpcSubSetData$Date, hpcSubSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S" ) 
globalActivePower <- as.numeric( hpcSubSetData$Global_active_power )
png( "plot2.png", width=480, height=480 )
plot( plotDateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)" )

# Close the file
dev.off()