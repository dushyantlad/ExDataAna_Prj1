#load the data to dataframe
data <- read.delim("household_power_consumption.txt", header = TRUE, sep = ";")

#subset the data for days 02/01 and 02/02
library(sqldf)
data_ss<-sqldf("select * from data where Date='1/2/2007' or Date='2/2/2007'")

#create png file
png(filename = "plot2.png", width = 480, height = 480, units = "px")

#plot the graph
with(data_ss, plot( as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"), as.numeric(Global_active_power)/500 , 
                    type='l', xlab='', ylab='Global Active Power (kilowatts)'))

#close device
dev.off()



