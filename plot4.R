# Reading, naming and subsetting power consumption data
#reading the text document
powers <- read.table("C:/Users/sandhya.2037869/Documents/Data Science/household_power_consumption.txt",skip=1,sep=";")
#naming the power
names(powers) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
#subsetting the power
subpowers <- subset(powers,powers$Date=="1/2/2007" | powers$Date =="2/2/2007")

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
subpowers$Date <- as.Date(subpowers$Date, format="%d/%m/%Y")
subpowers$Time <- strptime(subpowers$Time, format="%H:%M:%S")
subpowers[1:1440,"Time"] <- format(subpowers[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpowers[1441:2880,"Time"] <- format(subpowers[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# initiating a composite plot with many graphs
par(mfrow=c(2,2))

# calling the basic plot function that calls different plot functions to build the 4 plots that form the graph
with(subpowers,{
  plot(subpowers$Time,as.numeric(as.character(subpowers$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(subpowers$Time,as.numeric(as.character(subpowers$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(subpowers$Time,subpowers$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(subpowers,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(subpowers,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(subpowers,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(subpowers$Time,as.numeric(as.character(subpowers$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})