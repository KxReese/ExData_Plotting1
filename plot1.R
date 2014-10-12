## Plot1 creates a histogram chart of the "global active power"
## field for the 2007-02-01 to  2007-02-02 date range in the
## household_power_consumption dataset originally retrieved from the 
## UC Irvine Machine Learning Repository

plot1 <- function() {
	## Define column classes of dataset
	classes <- c("character", "character", "numeric", "numeric", 
		"numeric", "numeric", "numeric", "numeric", "numeric")
	
	## Read in txt file of data and subset date range
	hpc <- read.table("household_power_consumption.txt", header = TRUE, 
		na.strings = "?", sep = ";", colClasses = classes)
	data <- subset(hpc, (Date == "1/2/2007" | Date == "2/2/2007"))
	
	## Create png file of histogram
	png(filename = "plot1.png")
	hist(data$Global_active_power, col = "red", main="Global Active Power", 
		xlab="Global Active Power (kilowatts)")
	dev.off()
}
