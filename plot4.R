## The following code plots a plot all the previous plots in a single plot 



#Reading data from text file
#na.strings() is used to encode "?" in the dataset as NA values for easier processing
data<-read.csv("household_power_consumption.txt",sep = ";",na.strings="?")


#subsetting the data frame based on date values
#all values have been converted to Date format using strptime
wow=data[strptime(data$Date,format="%d/%m/%Y") == strptime("2/2/2007",format="%d/%m/%Y") | strptime(data$Date,format="%d/%m/%Y") == strptime("1/2/2007",format="%d/%m/%Y") ,]

#this works too
#wow2=data[data$Date == "2/2/2007" | data$Date == "1/2/2007" ,]


#merging
wow$DateTime <- paste(wow$Date, wow$Time) 
wow$DateTime <- strptime(wow$DateTime, format = "%Y-%m-%d %H:%M:%S")

#opening file
png("plot4.png", height=480, width=480)


#indicates that there will be 2 by 2 grid of plots
par(mfrow = c(2,2))


#plot1
plot(wow$DateTime,wow$Global_active_power,type = "l",xlab="",ylab="Global Active Power")


#plot2
plot(wow$DateTime,wow$Voltage,type = "l",xlab="datetime",ylab="Voltage")


#plot3
plot(wow$DateTime,wow$Sub_metering_1,type = "l",xlab="",ylab="Energy sub metering")
par(new = TRUE)
plot(wow$DateTime,wow$Sub_metering_2, ylim= range(c(wow$Sub_metering_1,wow$Sub_metering_2)), type = "l",xlab="",ylab="",axes = FALSE,col="red")
par(new = TRUE)
plot(wow$DateTime,wow$Sub_metering_3, ylim= range(c(wow$Sub_metering_1,wow$Sub_metering_3)), type = "l",xlab="",ylab="",axes = FALSE,col="blue")
#setting the legend of plot3
legend_labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend_colors <- c("black", "red", "blue")
legend("topright", legend = legend_labels, col = legend_colors, lty = 1, bg = "transparent", box.col = "transparent", cex = 0.75)



#plot4
par(new=FALSE)		# a new plot
plot(wow$DateTime,wow$Global_reactive_power,type = "l",xlab="datetime",ylab="Global_reactive_power")

#closing file
dev.off()