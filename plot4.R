dat<-read.csv("household_power_consumption.txt",header = TRUE,sep=";")
dat1<-dat
dat1$Date<-as.Date(dat1$Date,format="%d/%m/%Y")
dat1$Time<-strptime(paste(dat$Date,dat$Time), format="%d/%m/%Y %H:%M:%S")
d<-subset(dat1,Date>='2007-02-01')
d<-subset(d,Date<='2007-02-02')
d$Sub_metering_1<-as.numeric(as.character(d$Sub_metering_1))
d$Sub_metering_2<-as.numeric(as.character(d$Sub_metering_2))
d$Sub_metering_3<-as.numeric(as.character(d$Sub_metering_3))
par(mfrow=c(2,2),mar=c(5,4,2,1))
plot(d$Time,as.numeric(as.character(d$Global_active_power)),type="l",ylab = "Global Active Power", xlab="")
plot(d$Time,as.numeric(as.character(d$Voltage)),type="l",ylab = "Voltage", xlab="datetime")
plot(d$Time,d$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",ylim=c(0,max(max(d$Sub_metering_1),max(d$Sub_metering_2),max(d$Sub_metering_3))))
lines(d$Time,d$Sub_metering_2,type="l",col="red")
lines(d$Time,d$Sub_metering_3,type="l",col="blue")
legend("topright",pch="-",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n",cex = 0.7,lwd=3)
plot(d$Time,as.numeric(as.character(d$Global_reactive_power)),type="l",ylab = "Global_reactive_power", xlab="datetime")
 dev.copy(png,file="plot4.png",height=480,width=480,unit="px")
 dev.off()
