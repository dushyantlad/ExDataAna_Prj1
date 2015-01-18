#load the data to dataframe
data <- read.delim("household_power_consumption.txt", header = TRUE, sep = ";")

#subset the data for days 02/01 and 02/02
library(sqldf)
data_ss<-sqldf("select * from data where Date='1/2/2007' or Date='2/2/2007'")

#create png file
png(filename = "plot1.png", width = 480, height = 480, units = "px")

#plot the graph
hist(as.numeric(data_ss$Global_active_power)/500, xlab='Global Active Power (kilowatts)', col='red', main='Global Active Power')

#close device
dev.off()
