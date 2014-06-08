coltypes=c(rep("character",2), rep("numeric",7))
powdat <- read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses=coltypes,na.strings="?")
powdat$Date <- as.Date(powdat$Date, format="%d/%m/%Y")
newdat <- subset(powdat, powdat$Date == as.Date("2007-02-01") | powdat$Date == as.Date("2007-02-02"))
newdat$dtime <- strptime(paste(as.character(newdat$Date),newdat$Time), format="%Y-%m-%d %H:%M:%S")
png(filename = "plot4.png", width = 480, height = 480)
par(mfcol=c(2,2))

plot(newdat$dtime,newdat$Global_active_power,type="l", ylab="Global Active Power",xlab="")

plot(newdat$dtime,newdat$Sub_metering_1,type="l", ylab="Energy sub metering",xlab="")
lines(newdat$dtime,newdat$Sub_metering_2,type="l", col="red")
lines(newdat$dtime,newdat$Sub_metering_3,type="l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n", cex=0.7, lty=1, col = c("black","red","blue"))

plot(newdat$dtime,newdat$Voltage,type="l",ylab="Voltage",xlab="datetime")

plot(newdat$dtime,newdat$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")

dev.off()

