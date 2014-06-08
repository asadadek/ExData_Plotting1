library(data.table)

classes<-rep('character',9)
data <- fread('household_power_consumption.txt',sep=';',header=TRUE,colClasses=classes)
data$Date <- as.Date(data$Date,'%d/%m/%Y')
data <- data[Date == as.Date('01/02/2007','%d/%m/%Y') | Date == as.Date('02/02/2007','%d/%m/%Y')]
png('plot1.png',width=480,height=480)
hist(as.numeric(data$Global_active_power),col="red",xlab="Global Active Power (kilowatts)" ,main="Global Active Power")
dev.off()