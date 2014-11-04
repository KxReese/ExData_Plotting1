## plot4 creates a series of four charts of information for the 2007-02-01 
## to 2007-02-02 date range in the household_power_consumption
## dataset originally retrieved from the UC Irvine Machine Learning Repository

	## Define column classes of dataset
	classes <- c("character", "character", "numeric", "numeric", 
		"numeric", "numeric", "numeric", "numeric", "numeric")
	
	## Read in txt file of data and subset date range
	hpc <- read.table("household_power_consumption.txt", header = TRUE, 
		na.strings = "?", sep = ";", colClasses = classes)
	data <- subset(hpc, (Date == "1/2/2007" | Date == "2/2/2007"))
	
	## Create datetime field from date and time fields
	datetime <- strptime(paste(as.Date(data$Date, format = "%d/%m/%Y"),data$Time), 
		format = "%Y-%m-%d %H:%M:%S")
	newdata <- cbind(data, datetime)
	
	## Create png file of charts
	png(filename = "plot4.png")
		par(mfrow = c(2, 2))
		## Line chart of global active power
		plot(newdata$datetime, newdata$Global_active_power, type ="l", 
			ylab="Global Active Power", xlab="")
		## Line chart of voltage
		plot(newdata$datetime, newdata$Voltage, type ="l",
			ylab="Voltage", xlab="datetime")
		## Multi-line chart of sub metering stations 
		plot(newdata$datetime, newdata$Sub_metering_1, type ="l", 
			ylab="Energy sub metering", xlab="")
			lines(newdata$datetime, newdata$Sub_metering_2, col="red")
			lines(newdata$datetime, newdata$Sub_metering_3, col="blue")
			legend("topright", lty=1, col=c("black", "red", "blue"), 
			legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
		## Line chart of global reactive power
		plot(newdata$datetime, newdata$Global_reactive_power, type ="l",
			ylab="Global_reactive_power", xlab="datetime")
	dev.off()
