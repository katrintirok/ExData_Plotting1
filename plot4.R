#assignment1
#code for plot1

library(data.table)

#set work directory
#setwd('~/Copy/R/OnlineCourses/Coursera/ExplorDataAnalysis/Week1')

#read dat
header <- fread('household_power_consumption.txt', nrows=0)
data <- read.csv('household_power_consumption.txt', skip=65000, nrows=5000, 
                 na.strings='?', header=F, col.names=names(header), sep=";")
#join Date and Time and format datetime
data$datetime <- strptime(paste(as.character(data$Date), as.character(data$Time)),
                          "%d/%m/%Y %H:%M:%S")
#choose dates to work with
data1 <- subset(data, as.Date(datetime)>="2007-02-01" 
                & as.Date(datetime)<="2007-02-02")

#plot4
png('plot4.png', width=480, height=480, bg='transparent')
par(mfrow=c(2,2))
plot(data1$datetime,data1$Global_active_power, type="l", xlab='',
     ylab="Global Active Power")

plot(data1$datetime,data1$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(data1$datetime, data1$Sub_metering_1, type="l", col="black", xlab='',
     ylab="Energy sub metering")
lines(data1$datetime, data1$Sub_metering_2, col="red")
lines(data1$datetime, data1$Sub_metering_3, type="l", col="blue")
legend('topright', legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       lty = c(1, 1, 1), col=c('black','red','blue'))

plot(data1$datetime, data1$Global_reactive_power, type="l", ylab="Global_reactive_power",
     xlab="datetime")
dev.off()

par(mfrow=c(1,1))

