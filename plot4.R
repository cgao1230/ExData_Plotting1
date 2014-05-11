# For plot 4

# read the whole dataset
data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses="character")
# look at every record in dataset and only select on 2007-02-01 and 2007-02-02
Date <- strptime(data$Date,"%d/%m/%Y")
selected_index <- as.character(Date)=="2007-02-01" | as.character(Date)=="2007-02-02"
data <- data[selected_index,]

# plot 4 subplot
par(mfrow=c(2,2),mar=c(4,4,4,5),oma=c(0,0,0,0))
# subplot1
plot(as.numeric(data[,3]),xaxt='n',xlab='',ylab='Global active power',type='l',ylim=c(0,6),cex.lab=0.8,cex.axis=0.8)
axis(1,at=c(1,1440,2880),labels=c('Thu','Fri','Sat'))
# subplot2
plot(as.numeric(data[,5]),xaxt='n',xlab='datetime',ylab='Voltage',type='l',ylim=c(234,246),cex.lab=0.8,cex.axis=0.8)
axis(1,at=c(1,1440,2880),labels=c('Thu','Fri','Sat'))
axis(2,at=c(234,238,246),labels=c(234,238,246))
# subplot3
plot(as.numeric(data[,7]),type='l',col='black',xaxt='n',xlab='',ylab='Energy sub metering',cex.lab=0.8,cex.axis=0.8)
lines(as.numeric(data[,8]),type='l',col='red',xaxt='n')
lines(as.numeric(data[,9]),type='l',col='blue',xaxt='n')
axis(1,at=c(1,1440,2880),labels=c('Thu','Fri','Sat'))
axis(2,at=c(0,10,20,30),labels=c(0,10,20,30))
legend('topright',c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lty=1,cex=0.5)
# subplot4
plot(as.numeric(data[,4]),xaxt='n',xlab='datetime',ylab='Global_reactive_power',type='l',ylim=c(0,0.5),,cex.lab=0.8,cex.axis=0.8)
axis(1,at=c(1,1440,2880),labels=c('Thu','Fri','Sat'))
# save
dev.copy(png,'plot4.png')
dev.off()


