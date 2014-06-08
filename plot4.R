library(data.table)

classes<-rep('character',9)
data <- fread('household_power_consumption.txt',sep=';',header=TRUE,colClasses=classes)
data$Date <- as.Date(data$Date,'%d/%m/%Y')
data <- data[Date == as.Date('01/02/2007','%d/%m/%Y') | Date == as.Date('02/02/2007','%d/%m/%Y')]
data$Time <-  as.POSIXct(strptime(paste(as.character(data$Date,'%d/%m/%Y'),data$Time),format='%d/%m/%Y %H:%M:%S'))

data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

png('plot4.png',width=480,height=480)
par(mfcol=c(2,2))
plot(data$Time,data$Global_active_power,type="l",xlab="", ylab="Global Active Power (kilowatts)")

plot(data$Time,data$Sub_metering_1,type="l",xlab="", ylab="Energy Sub metering")
lines(data$Time,data$Sub_metering_2,type="l", col="red")
lines(data$Time,data$Sub_metering_3,type="l", col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n",lty=c(1,1,1),lwd=c(1,1,1),col=c("black","red","blue"))

plot(data$Time,data$Voltage,type="l",xlab="datetime", ylab="Voltage")

plot(data$Time,as.numeric(data$Global_reactive_power),type="l",xlab="datetime", ylab="Global_reactive_power")

dev.off()
