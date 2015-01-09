## The following code plots a plot of Energy submetering_1, 2 and 3... 
## overlayed on a single plot



#Reading data from text file
#na.strings() is used to encode "?" in the dataset as NA values for easier processing
data<-read.csv("household_power_consumption.txt",sep = ";",na.strings="?")



#subsetting the data frame based on date values
#all values have been converted to Date format using strptime
wow=data[strptime(data$Date,format="%d/%m/%Y") == strptime("2/2/2007",format="%d/%m/%Y") | strptime(data$Date,format="%d/%m/%Y") == strptime("1/2/2007",format="%d/%m/%Y") ,]

#this works too
#wow2=data[data$Date == "2/2/2007" | data$Date == "1/2/2007" ,]


wow$DateTime <- paste(wow$Date, wow$Time)  #merging
wow$DateTime <- strptime(wow$DateTime, format = "%Y-%m-%d %H:%M:%S")


#opening file
png("plot3.png", height=480, width=480)


#drawing 'line' graphs
plot(wow$DateTime,wow$Sub_metering_1,type = "l",xlab="",ylab="Energy sub metering")
par(new = TRUE)	# this indicates the next graph will be on the same plot
#the ylim parameter scales the graphs properly
plot(wow$DateTime,wow$Sub_metering_2, ylim= range(c(wow$Sub_metering_1,wow$Sub_metering_2)), type = "l",xlab="",ylab="",axes = FALSE,col="red")
par(new = TRUE)
plot(wow$DateTime,wow$Sub_metering_3, ylim= range(c(wow$Sub_metering_1,wow$Sub_metering_3)), type = "l",xlab="",ylab="",axes = FALSE,col="blue")



#setting the legend on the top right hand corner
legend_labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend_colors <- c("black", "red", "blue")
legend("topright", legend = legend_labels, col = legend_colors, lty = 1, bg = "transparent", box.col = "transparent", cex = 0.95)

#closing file
dev.off()



