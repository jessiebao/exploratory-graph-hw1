# Loading the data
filepath<-paste("E:/John Hopkin R Introduction/r data/","household_power_consumption.txt",sep="")
d1<-as.Date("2007-02-01","%Y-%m-%d")
d2<-as.Date("2007-02-02","%Y-%m-%d")
data<-read.table(filepath,na.strings="?",header=T,sep=";") # load all the data
data$Date<-as.Date(data$Date,"%d/%m/%Y") # covert Date variable from character class to Date class
data_sub<-data[(data$Date ==d1 | data$Date ==d2),] # subset the data 

# Making the plot 1
par(mfrow=c(1,2),mar=c(4,4,2,1))
hist(data_sub[data_sub$Date==d1,]$Global_active_power,
     col="red", main="Global Active Power in Feb 01, 2007", 
     xlab="Global Active Power (kilowatts)",ylab="Frequency",
     cex.main=0.7,cex.lab=0.7)
hist(data_sub[data_sub$Date==d2,]$Global_active_power,
     col="orange", main="Global Active Power in Feb 02, 2007", 
     xlab="Global Active Power (kilowatts)",ylab="Frequency",
     cex.main=0.7,cex.lab=0.7)
setwd("E:/John Hopkin R Introduction/r output")
dev.copy(png,file="plot1.png", width = 480, height = 480, units = "px")
dev.off()

