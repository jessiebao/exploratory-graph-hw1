# Loading the data
filepath<-paste("E:/John Hopkin R Introduction/r data/","household_power_consumption.txt",sep="")
d1<-as.Date("2007-02-01","%Y-%m-%d")
d2<-as.Date("2007-02-02","%Y-%m-%d")
data<-read.table(filepath,na.strings="?",header=T,sep=";") # load all the data
data$Date<-as.Date(data$Date,"%d/%m/%Y") # covert Date variable from character class to Date class
data_sub<-data[(data$Date ==d1 | data$Date ==d2),] # subset the data 
data_sub$Time<-strptime(data_sub$Time,"%H:%M:%s") # convert the Time variables to Time classes in R
data_sub$weekday<-weekdays(data_sub$Date)

# Making the plot 2
par(mfrow=c(1,1),mar=c(4,4,2,1))
a<-split(data_sub$Global_active_power,data_sub$weekday) # split power of data_sub by weekday
plot(c(a$Thursday,a$Friday),type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)",
     xaxt="n"
     )
#xaxt specifying "n" suppresses plotting of the axis
axis(side=1, at = c(0,1440,2880), labels = c("Thu", "Fri", "Sat")) # I know there are 1440 Thursday

# Saving the plot 2
setwd("E:/John Hopkin R Introduction/r output")
dev.copy(png,file="plot2.png", width = 480, height = 480, units = "px")
dev.off()