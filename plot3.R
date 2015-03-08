data<-read.table("../household_power_consumption.txt", sep=";", 
                 colClasses=c('character', 'character', 'numeric',
                              'numeric', 'numeric', 'numeric','numeric', 'numeric', 'numeric')
                 ,header=TRUE, na.strings='?')

data2 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
data2$DateTime <-  strptime(paste(data2$Date, data2$Time), "%d/%m/%Y %H:%M:%S")

png("plot3.png", width=480, height=480)

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
dev.off()