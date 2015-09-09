data <- read.csv("~/Desktop/household_power_consumption.txt", sep=";")
## I dowanloaded the dataset on my desktop

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

data_sub <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
data_sub$Global_active_power<-as.numeric(data_sub$Global_active_power)

attach(data_sub)

png(filename = "plot3.png", 
    width = 480, height = 480,
    units = "px", bg = "transparent")

plot(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Sub_metering_1,type='l',xlab="",ylab = 'Energy sub metering')
lines(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Sub_metering_2,col='red')
lines(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Sub_metering_3,col='blue')
legend("topright", col = c("black", "red", "blue"),c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd=1)

dev.off()