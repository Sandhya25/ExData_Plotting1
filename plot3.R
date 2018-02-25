
#reading the text document
powers <- read.table("C:/Users/sandhya.2037869/Documents/Data Science/household_power_consumption.txt",skip=1,sep=";")
#naming the power consumption data
names(powers) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

subpowers <- subset(powers,powers$Date=="1/2/2007" | powers$Date =="2/2/2007")

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
subpowers$Date <- as.Date(subpowers$Date, format="%d/%m/%Y")
subpowers$Time <- strptime(subpowers$Time, format="%H:%M:%S")
subpowers[1:1440,"Time"] <- format(subpowers[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpowers[1441:2880,"Time"] <- format(subpowers[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# calling the basic plot functions
plot(subpowers$Time,subpowers$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(subpowers,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(subpowers,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(subpowers,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# annotating graph
title(main="Energy sub-metering")