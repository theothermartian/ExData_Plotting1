data<-read.csv("household_power_consumption.txt",sep = ";",na.strings="?")

wow=data[strptime(data$Date,format="%d/%m/%Y") == strptime("2/2/2007",format="%d/%m/%Y") | strptime(data$Date,format="%d/%m/%Y") == strptime("1/2/2007",format="%d/%m/%Y") ,]

#this works too
#wow2=data[data$Date == "2/2/2007" | data$Date == "1/2/2007" ,]


wow$DateTime <- paste(wow$Date, wow$Time)  #merging
wow$DateTime <- strptime(wow$DateTime, format = "%Y-%m-%d %H:%M:%S")



png("plot3.png", height=480, width=480)


plot(wow$DateTime,wow$Sub_metering_1,type = "l",xlab="",ylab="Energy sub metering")
par(new = TRUE)


plot(wow$DateTime,wow$Sub_metering_2, ylim= range(c(wow$Sub_metering_1,wow$Sub_metering_2)), type = "l",xlab="",ylab="",axes = FALSE,col="red")
par(new = TRUE)

plot(wow$DateTime,wow$Sub_metering_3, ylim= range(c(wow$Sub_metering_1,wow$Sub_metering_3)), type = "l",xlab="",ylab="",axes = FALSE,col="blue")


legend_labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend_colors <- c("black", "red", "blue")
legend("topright", legend = legend_labels, col = legend_colors, lty = 1, bg = "transparent", box.col = "transparent", cex = 0.95)


dev.off()


