file <- "household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", na.strings='?',stringsAsFactors=FALSE, dec=".",)
subdata <- subdata1<-subset(data1, data1$Date %in% c('1/2/2007','2/2/2007'))


#plotting Global Active Power
gap<-subdata1$Global_active_power
png("plot1.png", width=480, height=480)
hist(gap, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()