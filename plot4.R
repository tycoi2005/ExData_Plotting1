data<-read.table("../household_power_consumption.txt", sep=";", 
                 colClasses=c('character', 'character', 'numeric',
                              'numeric', 'numeric', 'numeric','numeric', 'numeric', 'numeric')
                 ,header=TRUE, na.strings='?')

data2 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
data2$DateTime <-  strptime(paste(data2$Date, data2$Time), "%d/%m/%Y %H:%M:%S")

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
#plot2
plot(data2$DateTime,
     data2$Global_active_power,
     pch=NA,
     xlab="",
     ylab="Global Active Power (kilowatts)")
lines(data2$DateTime, data2$Global_active_power)
#Voltage
plot(data2$DateTime, data2$Voltage, ylab="Voltage", xlab="datetime", pch=NA)
lines(data2$DateTime, data2$Voltage)

#plot3
plot(data2$DateTime, 
     data2$Sub_metering_1, 
     pch=NA, 
     xlab="", 
     ylab="Energy sub metering")
lines(data2$DateTime, data2$Sub_metering_1)
lines(data2$DateTime, data2$Sub_metering_2, col='red')
lines(data2$DateTime, data2$Sub_metering_3, col='blue')
legend('topright', 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1),
       col = c('black', 'red', 'blue'))
#Global reactive power
with(data2, plot(DateTime, Global_reactive_power, xlab='datetime', pch=NA))
with(data2, lines(DateTime, Global_reactive_power))

dev.off()