data <- read.csv("~/Desktop/household_power_consumption.txt", sep=";")
## I dowanloaded the dataset on my desktop

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

data_sub <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
data_sub$Global_active_power<-as.numeric(data_sub$Global_active_power)

attach(data_sub)

png(filename = "plot4.png", 
    width = 480, height = 480,
    units = "px", bg = "transparent")

par(mfrow=c(2,2))
plot(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Global_active_power,type='l',xlab="",ylab = 'Global Active Power (kilowatts)')
plot(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Voltage,type='l',xlab='datetime',ylab='Voltage')
plot(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Sub_metering_1,type='l',xlab="",ylab = 'Energy sub metering')
lines(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Sub_metering_2,col='red')
lines(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Sub_metering_3,col='blue')
legend("topright",legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lwd=1)
plot(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Global_reactive_power,type='l',xlab='datetime')

dev.off()
