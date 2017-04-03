#Read Data
data <- read.table("household_power_consumption.txt", header=TRUE, stringsAsFactors=FALSE,sep=";")

#Subset Data
subsetData<-subset(data, Date=="1/2/2007" | Date=="2/2/2007")

#Convert Global Active Power to Numeric
globalpower <- as.numeric(subsetData$Global_active_power)

#Convert Date and Time
dateTime <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Covert all 3 Sub_Metering to numeric
sub1 <- as.numeric(subsetData$Sub_metering_1)
sub2 <- as.numeric(subsetData$Sub_metering_2)
sub3 <- as.numeric(subsetData$Sub_metering_3)

#Make Plot
png("plot3.png", width=480, height=480)
plot(dateTime, sub1, type="l", ylab="Energy Submetering", xlab="")
lines(dateTime, sub2, type="l", col="red")
lines(dateTime, sub3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=2)
dev.off()