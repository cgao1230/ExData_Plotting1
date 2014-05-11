# For plot 3

# read the whole dataset
data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses="character")
# look at every record in dataset and only select on 2007-02-01 and 2007-02-02
Date <- strptime(data$Date,"%d/%m/%Y")
selected_index <- as.character(Date)=="2007-02-01" | as.character(Date)=="2007-02-02"
data <- data[selected_index,]

# plot the second plot 
plot(as.numeric(data[,7]),type='l',col='black',xaxt='n',xlab='',ylab='Energy sub metering')
lines(as.numeric(data[,8]),type='l',col='red',xaxt='n')
lines(as.numeric(data[,9]),type='l',col='blue',xaxt='n')
axis(1,at=c(1,1440,2880),labels=c('Thu','Fri','Sat'))
legend('topright',c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lty=1)
# save into plot3.png
dev.copy(png,'plot3.png')
dev.off()