#load the data to dataframe
data <- read.delim("household_power_consumption.txt", header = TRUE, sep = ";")

#subset the data for days 02/01 and 02/02
library(sqldf)
data_ss<-sqldf("select * from data where Date='1/2/2007' or Date='2/2/2007' and Date!='?' and Voltage!='?'")

#create png file
png(filename = "plot3.png", width = 480, height = 480, units = "px")

#plot the graph
with(data_ss,plot(as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"), as.numeric(as.character(Sub_metering_1))  , type='l', xlab='', ylab='Energy Sub metering', yaxt="n",ylim=c(0,40)))
with(data_ss,points(as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"), as.numeric(as.character(Sub_metering_2)) , type='l' ,col='red') )
with(data_ss,points(as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"), as.numeric(as.character(Sub_metering_3)) , type='l' ,col='blue') )
axis(side=2, at=c(0,10,20,30), labels=c(0,10,20,30))

legend("topright",pch=' - ',lty=1,seg.len=2,col=c("black","red","blue"),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))

#close device
dev.off()



