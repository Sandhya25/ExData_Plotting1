#Reading and subsetting
dataFile <- "./Data Science/household_power_consumption.txt"
powers <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subpowers <- powers[powers$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subpowers)
datetime <- strptime(paste(subpowers$Date, subpowers$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("./Data Science/plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()