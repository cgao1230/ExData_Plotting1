# For plot 2

# read the whole dataset
data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses="character")
# look at every record in dataset and only select on 2007-02-01 and 2007-02-02
Date <- strptime(data$Date,"%d/%m/%Y")
selected_index <- as.character(Date)=="2007-02-01" | as.character(Date)=="2007-02-02"
data <- data[selected_index,]

# plot the second plot 
plot(as.numeric(data[,3]),xaxt='n',xlab='',ylab='Global active power (kilowatts)',type='l')
axis(1,at=c(1,1440,2880),labels=c('Thu','Fri','Sat'))
# save into plot2.png
dev.copy(png,'plot2.png')
dev.off()