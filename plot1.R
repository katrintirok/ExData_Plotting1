#assignment1
#code for plot1

library(data.table)

#set work directory
#setwd('~/Copy/R/OnlineCourses/Coursera/ExplorDataAnalysis/Week1')

#read data
header <- fread('household_power_consumption.txt', nrows=0)
data <- read.csv('household_power_consumption.txt', skip=65000, nrows=5000, 
                 na.strings='?', header=F, col.names=names(header), sep=";")
#join Date and Time and format datetime
data$datetime <- strptime(paste(as.character(data$Date), as.character(data$Time)),
                          "%d/%m/%Y %H:%M:%S")
#choose dates to work with
data1 <- subset(data, as.Date(datetime)>="2007-02-01" 
                & as.Date(datetime)<="2007-02-02")

#plot1 - histogram
png("plot1.png", height=480, width=480, units="px", bg='transparent')
hist(data1$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", col="red")
dev.off()
