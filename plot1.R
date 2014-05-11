# For plot 1

# read the whole dataset
data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses="character")
# look at every record in dataset and only select on 2007-02-01 and 2007-02-02
Date <- strptime(data$Date,"%d/%m/%Y")
selected_index <- as.character(Date)=="2007-02-01" | as.character(Date)=="2007-02-02"
data <- data[selected_index,]

# plot the first plot 
hist(as.numeric(data[,3]),11,col="red",xlab="Global active power (kilowatts)",main="Global active power")
# save into plot1.png
dev.copy(png,'plot1.png')
dev.off()