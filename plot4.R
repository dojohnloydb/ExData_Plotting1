#read data from file
file<-"household_power_consumption.txt"
data<-read.table(file,sep=';',as.is=T,na.strings='?',header=T)

#subsetting data dated from 2007-02-01 to 2007-02-02
subdata<-subset(data,data$Date %in% c("1/2/2007","2/2/2007"))

#preparing x axis 
datetime1<-paste(subdata$Date,subdata$Time,sep=" ")
datetime1<-strptime(datetime1,"%d/%m/%Y %H:%M:%S")

#plotting adn saving as png file
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

#Global Active Power
plot(datetime1,subdata$Global_active_power,type='l',ylab="Global Active Power", xlab="")

#Voltage
plot(datetime1,subdata$Voltage,type='l',ylab="Voltage", xlab="")

#Energy sub metering
plot(datetime1,subdata$Sub_metering_1,type='l',ylab="Energy Submetering", xlab="")
lines(datetime1,subdata$Sub_metering_2,type='l',col="red")
lines(datetime1,subdata$Sub_metering_3,type='l',col="blue")
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1,lwd=2,col=c("black","red","blue"))

#Global Active Power
plot(datetime1,subdata$Global_reactive_power,type='l',ylab="Global Reactive Power", xlab="")

dev.off()