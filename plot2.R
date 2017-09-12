getwd()
setwd("/Users/qinliuvt.edu/Downloads")
data<-read.table('household_power_consumption.txt',sep=';', header = TRUE)
object.size(data)
head(data)
str(data)
datadf<-data[data$Date=='1/2/2007'|data$Date=='2/2/2007',]
datadf$datetime<-strptime(paste(datadf$Date, datadf$Time), format="%d/%m/%Y %H:%M:%S")
datadf$Global_active_power<-as.numeric(datadf$Global_active_power)

png('plot2.png', width=280, height=480)
plot(datadf$datetime, datadf$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

