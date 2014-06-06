plot3 <- function()
{
dataset <- read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses="character")		## read data from file
data <- dataset[dataset[,1] == "1/2/2007" | dataset[,1] == "2/2/2007",]							## filter data for to only include 1&2 Feb 2007
x <- strptime(paste(data[,1],data[,2]),format="%d/%m/%Y %H:%M:%S")							## add date and time together in time format and assign values to x variable
y1 <- as.numeric(data[,7])														## assign values to y variable for each of the line graphs
y2 <- as.numeric(data[,8])
y3 <- as.numeric(data[,9])
png(file = "plot3.png")															## create PNG file
plot(c(rep(x,3)), c(y1,y2,y3), ylab="Energy sub metering", xlab="", type="n")						## plot points
lines(x,y1,type="l",col="black")													## create line graphs
lines(x,y2,type="l",col="red")
lines(x,y3,type="l",col="blue")
legend("topright",legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),xjust=1,yjust=1,lty=1)	## create legend
dev.off()
}
