data<-read.table("../household_power_consumption.txt", sep=";", 
                 colClasses=c('character', 'character', 'numeric',
                              'numeric', 'numeric', 'numeric','numeric', 'numeric', 'numeric')
                 ,header=TRUE, na.strings='?')

data2 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
data2$DateTime <-  strptime(paste(data2$Date, data2$Time), "%d/%m/%Y %H:%M:%S")

png("plot2.png", width=480, height=480)
plot(data2$DateTime,
     data2$Global_active_power,
     pch=NA,
     xlab="",
     ylab="Global Active Power (kilowatts)")
lines(data2$DateTime, data2$Global_active_power)
dev.off()