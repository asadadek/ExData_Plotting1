library(data.table)

classes<-rep('character',9)
data <- fread('household_power_consumption.txt',sep=';',header=TRUE,colClasses=classes)
data$Date <- as.Date(data$Date,'%d/%m/%Y')
data <- data[Date == as.Date('01/02/2007','%d/%m/%Y') | Date == as.Date('02/02/2007','%d/%m/%Y')]
data$Time <-  as.POSIXct(strptime(paste(as.character(data$Date,'%d/%m/%Y'),data$Time),format='%d/%m/%Y %H:%M:%S'))
png('plot2.png',width=480,height=480)
plot(data$Time,data$Global_active_power,type="l",xlab="", ylab="Global Active Power (kilowatts)")
dev.off()