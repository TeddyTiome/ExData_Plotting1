data <- read.csv("~/Desktop/household_power_consumption.txt", sep=";")
## I dowanloaded the dataset on my desktop

data$Date <- as.Date(data$Date, format="%d/%m/%Y")


data_sub <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
data_sub$Global_active_power<-as.numeric(data_sub$Global_active_power)

attach(data_sub)

png(filename = "plot2.png", 
    width = 480, height = 480,
    units = "px", bg = "transparent")

plot(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Global_active_power/500,type='l',xlab="",ylab = 'Global Active Power (kilowatts)')

dev.off()