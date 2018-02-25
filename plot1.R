#Reading text docement
powers <- read.table("C:/Users/sandhya.2037869/Documents/Data Science/household_power_consumption.txt",skip=1,sep=";")
#naming the power consumption data
names(powers) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpowers <- subset(powers,powers$Date=="1/2/2007" | powers$Date =="2/2/2007")

#calling the basic plot function
hist(as.numeric(as.character(subpowers$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

# annotating graph
title(main="Global Active Power")
