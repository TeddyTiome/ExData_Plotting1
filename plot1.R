data <- read.csv("~/Desktop/household_power_consumption.txt", sep=";")
## I dowanloaded the dataset on my desktop

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

data_sub <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
data_sub$Global_active_power<-as.numeric(data_sub$Global_active_power)


setwd("~/Desktop/ExData_Plotting1/")

png(filename = "plot1.png", 
    width = 480, height = 480, 
    units = "px", bg = "transparent")

hist((data_sub$Global_active_power)/500, main="Global Active Power", breaks=12,
     ,xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red",ylim=c(0,1200))

dev.off()