dat1<-read.csv("household_power_consumption.txt",header = TRUE,sep=";")
dat1$Date<-as.Date(dat1$Date,format="%d/%m/%Y")
dat1$Time<-strptime(paste(dat$Date,dat$Time), format="%d/%m/%Y %H:%M:%S")
d<-subset(dat1,Date>='2007-02-01')
d<-subset(d,Date<='2007-02-02')
`
plot(d$Time,as.numeric(as.character(d$Global_active_power)),type="l",ylab = "Global Active Power (kilowatts)", xlab="")
dev.copy(png,file="plot2.png",height=480,width=480,unit="px")
dev.off()
