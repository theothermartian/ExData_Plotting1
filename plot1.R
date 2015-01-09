## The following code plots a histogram of Global active power for 2 calender days


#Reading data from text file
#na.strings() is used to encode "?" in the dataset as NA values for easier processing
data<-read.csv("household_power_consumption.txt",sep = ";",na.strings="?")

#subsetting the data frame based on date values
#all values have been converted to Date format using strptime
wow=data[strptime(data$Date,format="%d/%m/%Y") == strptime("2/2/2007",format="%d/%m/%Y") | strptime(data$Date,format="%d/%m/%Y") == strptime("1/2/2007",format="%d/%m/%Y") ,]

#Only string comparison works too
#wow=data[data$Date == "2/2/2007" | data$Date == "1/2/2007" ,]

#opening file
png("plot1.png", height=480, width=480)

#plotting a histogram
hist(wow$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

#closing file
dev.off()
