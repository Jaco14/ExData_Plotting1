plot4 <- function()
{
dataset <- read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses="character")		## read data from file
data <- dataset[dataset[,1] == "1/2/2007" | dataset[,1] == "2/2/2007",]							## filter data for to only include 1&2 Feb 2007
x <- strptime(paste(data[,1],data[,2]),format="%d/%m/%Y %H:%M:%S")							## add date and time together in time format and assign values to x variable

y_global_active <- as.numeric(data[,3])												## assign values to y variable for first graph
y_voltage <- as.numeric(data[,5])													## assign values to y variable for second graph
y1 <- as.numeric(data[,7])														## assign values to y variable for each of the line graphs for graph 3
y2 <- as.numeric(data[,8])
y3 <- as.numeric(data[,9])
y_global_reactive <- as.numeric(data[,4])												## assign values to y variable for fourth graph

png(file = "plot4.png")															## create PNG file
par(mfrow=c(2,2))																## set up frame for 2x2 graphs

plot(x, y_global_active, ylab="Global Active Power (kilowatts)", xlab="", type="n")					## plot points for first graph
lines(x,y_global_active,type="l")													## creates line graph for first graph

plot(x, y_voltage, ylab="Voltage", xlab="datetime", type="n")								## plot points for second graph
lines(x,y_voltage,type="l")														## creates line graph for second graph

plot(c(rep(x,3)), c(y1,y2,y3), ylab="Energy sub metering", xlab="", type="n")						## plot points for third graph
lines(x,y1,type="l",col="black")													## create line graphs for third graph
lines(x,y2,type="l",col="red")
lines(x,y3,type="l",col="blue")
legend("topright",legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),xjust=1,yjust=1,lty=1,bty ="n")	## create legend

plot(x, y_global_reactive, ylab="Global_reactive_power", xlab="datetime", type="n")					## plot points for fourth graph
lines(x,y_global_reactive,type="l")													## creates line graph for fourth graph

dev.off()
}
