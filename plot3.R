
##Program plot3.R for Course Project 1

##read de original dataset
data<-read.table("./household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.string="?")

##subset the dataset using data from the dates 2007-02-01 and 2007-02-02
tidy<-subset(data, as.Date(Date, "%d/%m/%Y") >="2007-02-01" & as.Date(Date, "%d/%m/%Y") <="2007-02-02")

##launch apng graphics device
png(filename = "./plot3.png", width = 480, height = 480, bg = "grey55")

##construction of plot1
dateTime <- strptime(paste(tidy$Date,tidy$Time), format="%d/%m/%Y %H:%M:%S")
with(tidy, {
  plot(dateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")
  lines(dateTime, Sub_metering_2, type="l", col="red")
  lines(dateTime, Sub_metering_3, type="l", col="blue")
  legend("topright", lty = 1, lwd=c(2.5,2.5,2.5), col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
})

##close graphics device
dev.off()


