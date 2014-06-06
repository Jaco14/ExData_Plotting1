plot1 <- function()
{
dataset <- read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses="character")		## read data from file
data <- dataset[dataset[,1] == "1/2/2007" | dataset[,1] == "2/2/2007",]							## filter data for to only include 1&2 Feb 2007
png(file = "plot1.png")															## create PNG file
hist(as.numeric(data[,3]), main="Global Active Power",xlab="Global Active Power (kilowatts)", col="red")	## create histogram
dev.off()
}