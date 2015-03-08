data<-read.table("../household_power_consumption.txt", sep=";", 
                 colClasses=c('character', 'character', 'numeric',
                              'numeric', 'numeric', 'numeric','numeric', 'numeric', 'numeric')
                 ,header=TRUE, na.strings='?')

data1 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

png("plot1.png", width=480, height=480)
hist(data1$Global_active_power, col='red', 
     xlab = 'Global Active Power (kilowatts)',
     main = 'Global Active Power')
dev.off()