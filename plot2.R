data<-read.csv("household_power_consumption.txt",sep = ";",na.strings="?")

wow=data[strptime(data$Date,format="%d/%m/%Y") == strptime("2/2/2007",format="%d/%m/%Y") | strptime(data$Date,format="%d/%m/%Y") == strptime("1/2/2007",format="%d/%m/%Y") ,]

#this works too
#wow2=data[data$Date == "2/2/2007" | data$Date == "1/2/2007" ,]


wow$DateTime <- paste(wow$Date, wow$Time)  #merging
wow$DateTime <- strptime(wow$DateTime, format = "%Y-%m-%d %H:%M:%S")


png("plot2.png", height=480, width=480)


plot(wow$DateTime,wow$Global_active_power,type = "l",xlab="",ylab="Global Active Power(kilowatts)")


dev.off()