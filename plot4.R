getwd()
setwd("/Users/qinliuvt.edu/Downloads")
data<-read.table('household_power_consumption.txt',sep=';', header = TRUE)
object.size(data)
head(data)
str(datadf)
datadf<-data[data$Date=='1/2/2007'|data$Date=='2/2/2007',]
datadf$datetime<-strptime(paste(datadf$Date, datadf$Time), format="%d/%m/%Y %H:%M:%S")
names(datadf)

datadf$Global_active_power<-as.numeric(datadf$Global_active_power)
datadf$Sub_metering_1<-as.numeric(datadf$Sub_metering_1)
datadf$Sub_metering_2<-as.numeric(datadf$Sub_metering_2)
datadf$Voltage<-as.numeric(datadf$Voltage)
datadf$Global_reactive_power<-as.numeric(datadf$Global_reactive_power)


png('plot4.png', width=960, height=960)

par(mfrow=c(2,2))
plot(datadf$datetime, datadf$Global_active_power, type='l', ylab='Global Active Power')
plot(datadf$datetime, datadf$Voltage, type='l', ylab='Voltage')
plot(datadf$datetime, datadf$Sub_metering_1, type='l')
lines(datadf$datetime, datadf$Sub_metering_2, type='l', col='red')
lines(datadf$datetime, datadf$Sub_metering_3, type='l', col='blue')
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1,col=c('black','red', 'blue'), cex=0.5)
plot(datadf$datetime, datadf$Global_reactive_power, type='l', xlab='datetime', ylab='Global_reactive_power,')
dev.off()


