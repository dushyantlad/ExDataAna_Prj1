#load the data to dataframe
data <- read.delim("household_power_consumption.txt", header = TRUE, sep = ";")

#subset the data for days 02/01 and 02/02
library(sqldf)
data_ss<-sqldf("select * from data where Date='1/2/2007' or Date='2/2/2007'")

#create png file
png(filename = "plot4.png", width = 480, height = 480, units = "px")

#plot the graph
par(mfrow=c(2,2),mar=c(4,4,2,2), oma=c(0,0,0,0))
with(data_ss,{
      plot(as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"), as.numeric(Global_active_power)/500 , type='l', xlab='', ylab='Global Active Power') 
      plot(as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"), Voltage , type='l', xlab='datetime', ylab='Voltage',yaxt="n",ylim=c(800,2200))
      axis(side=2, at=c(800,1000,1200,1400,1600,1800,2000), labels=c(234,236,238,240,242,244,246))
      
      with(data_ss,plot(as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"), as.numeric(as.character(Sub_metering_1))  , type='l', xlab='', ylab='Energy Sub metering', yaxt="n",ylim=c(0,40)))
      with(data_ss,points(as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"), as.numeric(as.character(Sub_metering_2)) , type='l' ,col='red') )
      with(data_ss,points(as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"), as.numeric(as.character(Sub_metering_3)) , type='l' ,col='blue') )
      axis(side=2, at=c(0,10,20,30), labels=c(0,10,20,30))
      legend("topright",pch=' - ',lty=1,seg.len=2, cex=0.9, col=c("black","red","blue"),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), bty="n")
      
      plot(as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"), as.numeric(as.character(Global_reactive_power)) , type='l', xlab='datetime', ylab='Global_reactive_power',yaxt="n", ylim=c(0.0,0.5))
      axis(side=2, at=c(0.0,0.1,0.2,0.3,0.4,0.5), labels=c(0.0,0.1,0.2,0.3,0.4,0.5))
     })

#close device
dev.off()



