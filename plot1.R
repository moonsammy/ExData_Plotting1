# Load the data
hpcDataFile <- "./data/household_power_consumption.txt"
hpcData <- read.table( hpcDataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec="." )
# Subset the data to our timeframe
hpcSubSetData <- hpcData[hpcData$Date %in% c( "1/2/2007", "2/2/2007" ) ,]

# Plot the subset data
globalActivePower <- as.numeric( hpcSubSetData$Global_active_power )
png( "plot1.png", width=480, height=480 )
hist( globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)" )

# Close the file
dev.off()