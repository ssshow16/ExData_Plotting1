## Load Data
ds <- read.table(file="household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",stringsAsFactors=FALSE)
ds$Date <- as.Date(strptime(ds$Date,"%d/%m/%Y"))

ds$DT <- paste(ds$Date,ds$Time,sep=" ")
ds$DT <- as.POSIXlt(ds$DT)

#save as png
png(filename="plot2.png",width=480,height=480)

ds <- subset(x=ds,Date == "2007-02-01" | Date == "2007-02-02")
plot(x=ds$DT,
     y=ds$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power(killowatts)")

dev.off()

