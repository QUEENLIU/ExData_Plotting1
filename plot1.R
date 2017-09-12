getwd()
setwd("/Users/qinliuvt.edu/Downloads")
data<-read.table('household_power_consumption.txt',sep=';', header = TRUE)
object.size(data)
head(data)
str(data)
datadf<-data[data$Date=='1/2/2007'|data$Date=='2/2/2007',]
datadf$datetime<-strptime(paste(datadf$Date, datadf$Time), format="%d/%m/%Y %H:%M:%S")
names(datadf)

datadf$Global_active_power<-as.numeric(datadf$Global_active_power)


png('plot1.png', width = 480, height = 480)
hist(datadf$Global_active_power/1000,col='red',main='Global Active Power',xlab="Global Active Power (killowatts)")
dev.off()
