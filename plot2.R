## The following code plots a histogram of Global active power for 2 calender days in a continuous fashion

#Reading data from text file
#na.strings() is used to encode "?" in the dataset as NA values for easier processing
data<-read.csv("household_power_consumption.txt",sep = ";",na.strings="?")


#subsetting the data frame based on date values
#all values have been converted to Date format using strptime
wow=data[strptime(data$Date,format="%d/%m/%Y") == strptime("2/2/2007",format="%d/%m/%Y") | strptime(data$Date,format="%d/%m/%Y") == strptime("1/2/2007",format="%d/%m/%Y") ,]

#this works too
#wow2=data[data$Date == "2/2/2007" | data$Date == "1/2/2007" ,]

#merging data and time in a variable so as to get a fairly continuous data points
wow$DateTime <- paste(wow$Date, wow$Time)  
wow$DateTime <- strptime(wow$DateTime, format = "%Y-%m-%d %H:%M:%S")

#opening file
png("plot2.png", height=480, width=480)

#plotting a histogram
plot(wow$DateTime,wow$Global_active_power,type = "l",xlab="",ylab="Global Active Power(kilowatts)")

#closing file
dev.off()