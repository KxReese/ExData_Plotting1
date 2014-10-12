## Plot3 creates a line chart of the sub_metering 1, 2, and 3
## fields for the 2007-02-01 to  2007-02-02 date range in the
## household_power_consumption dataset originally retrieved from the 
## UC Irvine Machine Learning Repository

plot3 <- function() {
	## Define column classes of dataset
	classes <- c("character", "character", "numeric", "numeric", 
		"numeric", "numeric", "numeric", "numeric", "numeric")
	
	## Read in txt file of data and subset date range
	hpc <- read.table("household_power_consumption.txt", header = TRUE, 
		na.strings = "?", sep = ";", colClasses = classes)
	data <- subset(hpc, (Date == "1/2/2007" | Date == "2/2/2007"))
	
	## Create datetime field from date and time fields
	dtime <- strptime(paste(as.Date(data$Date, format = "%d/%m/%Y"),data$Time), 
		format = "%Y-%m-%d %H:%M:%S")
	newdata <- cbind(data, dtime)
	
	## Create png file of line chart
	png(filename = "plot3.png")
		plot(newdata$dtime, newdata$Sub_metering_1, type ="l", 
			ylab="Energy sub metering", xlab="")
		lines(newdata$dtime, newdata$Sub_metering_2, col="red")
		lines(newdata$dtime, newdata$Sub_metering_3, col="blue")
		legend("topright", lty=1, col=c("black", "red", "blue"), 
		legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
	dev.off()
}
