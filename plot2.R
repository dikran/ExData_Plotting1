coltypes=c(rep("character",2), rep("numeric",7))
powdat <- read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses=coltypes,na.strings="?")
powdat$Date <- as.Date(powdat$Date, format="%d/%m/%Y")
newdat <- subset(powdat, powdat$Date == as.Date("2007-02-01") | powdat$Date == as.Date("2007-02-02"))
newdat$dtime <- strptime(paste(as.character(newdat$Date),newdat$Time), format="%Y-%m-%d %H:%M:%S")
png(filename = "plot1.png", width = 480, height = 480)

plot(newdat$dtime,newdat$Global_active_power,type="l", ylab="Global Active Power (kilowatts)",xlab="")

dev.off()

