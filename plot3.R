# Loading the data
filepath<-paste("E:/John Hopkin R Introduction/r data/","household_power_consumption.txt",sep="")
d1<-as.Date("2007-02-01","%Y-%m-%d")
d2<-as.Date("2007-02-02","%Y-%m-%d")
data<-read.table(filepath,na.strings="?",header=T,sep=";") # load all the data
data$Date<-as.Date(data$Date,"%d/%m/%Y") # covert Date variable from character class to Date class
data_sub<-data[(data$Date ==d1 | data$Date ==d2),] # subset the data 
data_sub$Time<-strptime(data_sub$Time,"%H:%M:%s") # convert the Time variables to Time classes in R
data_sub$weekday<-weekdays(data_sub$Date)

# Making the plot 3
par(mfcol=c(1,1),mar=c(4,4,2,1))

a<-split(Sub_metering_1,weekday) # split power of data_sub by weekday
plot(c(a$Thursday,a$Friday),type="l",xlab="",
     ylab="Energy sub metering",
     xaxt="n")
a<-split(Sub_metering_2,weekday)
lines(c(a$Thursday, a$Friday),col="red")
a<-split(Sub_metering_3,weekday)
lines(c(a$Thursday, a$Friday),col="blue")
axis(side=1, at = c(0,1440,2880), labels = c("Thu", "Fri", "Sat")) # I know there are 1440 Thursday
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1,col=c("black","red","blue"))

# Saving the plot 3
setwd("E:/John Hopkin R Introduction/r output")
dev.copy(png,file="plot3.png", width = 480, height = 480, units = "px")
dev.off()
