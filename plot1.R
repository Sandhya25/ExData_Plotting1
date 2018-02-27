#Reading and subsetting
dataFile <- "./Data Science/household_power_consumption.txt"
powers <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subpowers <- powers[powers$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subpowers)
globalActivePower <- as.numeric(subpowers$Global_active_power)
png("./Data Science/plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()