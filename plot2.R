
##Program plot2.R for Course Project 1

##read de original dataset
data<-read.table("./household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.string="?")

##subset the dataset using data from the dates 2007-02-01 and 2007-02-02
tidy<-subset(data, as.Date(Date, "%d/%m/%Y") >="2007-02-01" & as.Date(Date, "%d/%m/%Y") <="2007-02-02")

##launch apng graphics device
png(filename = "./plot2.png", width = 480, height = 480, bg = "grey55")

##construction of plot1
dateTime <- strptime(paste(tidy$Date,tidy$Time), format="%d/%m/%Y %H:%M:%S")
with(tidy, plot(dateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
                
##close graphics device
dev.off()


