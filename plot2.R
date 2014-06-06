plot2 <- function()
{
dataset <- read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses="character")		## read data from file
data <- dataset[dataset[,1] == "1/2/2007" | dataset[,1] == "2/2/2007",]							## filter data for to only include 1&2 Feb 2007
x <- strptime(paste(data[,1],data[,2]),format="%d/%m/%Y %H:%M:%S")							## adds date and time together in time format and assigns values to x variable
y <- as.numeric(data[,3])														## assigns values to y variable
png(file = "plot2.png")															## create PNG file
plot(x, y, ylab="Global Active Power (kilowatts)", xlab="", type="n")							## plot points
lines(x,y,type="l")															## creates line graph
dev.off()
}