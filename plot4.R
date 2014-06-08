## Load Data
ds <- read.table(file="household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",stringsAsFactors=FALSE)
ds$Date <- as.Date(strptime(ds$Date,"%d/%m/%Y"))

ds$DT <- paste(ds$Date,ds$Time,sep=" ")
ds$DT <- as.POSIXlt(ds$DT)

#save as png
png(filename="plot4.png",width=480,height=480)

ds <- subset(x=ds,Date == "2007-02-01" | Date == "2007-02-02")

par(mfrow=c(2,2))

## TOP LEFT
plot(x=ds$DT, y=ds$Global_active_power, type="l", xlab="", ylab="Global Active Power")

## TOP RIGHT
plot(x=ds$DT, y=ds$Voltage, type="l", xlab="",ylab="Voltage")

## BOTTOM LEFT
plot(x=ds$DT, y=ds$Sub_metering_1,type="n", ylab="Energy sub metering")

lines(x=ds$DT,y=ds$Sub_metering_1,col="black")
lines(x=ds$DT,y=ds$Sub_metering_2,col="red")
lines(x=ds$DT,y=ds$Sub_metering_3,col="blue")

legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lty=1,bty="n")

## BOTTOM RIGHT
plot(x=ds$DT, y=ds$Global_reactive_power, type="l", xlab="",ylab="Voltage")

dev.off()

