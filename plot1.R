## Load Data
ds <- read.table(file="household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
ds$Date <- as.Date(strptime(ds$Date,"%d/%m/%Y"))

#save as png
png(filename="plot1.png",width=480,height=480)
ds <- subset(x=ds,Date == "2007-02-01" | Date == "2007-02-02")

hist(ds$Global_active_power,col="red",
          main="Gloval Active Power",
          xlab="Global Active Power(kilowatts)")

dev.off()
