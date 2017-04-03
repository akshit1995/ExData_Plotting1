#Read Data
data <- read.table("household_power_consumption.txt", header=TRUE, stringsAsFactors=FALSE,sep=";")

#Subset Data
subsetData<-subset(data, Date=="1/2/2007" | Date=="2/2/2007")

#Convert Global Active Power to Numeric
globalpower <- as.numeric(subsetData$Global_active_power)

#Convert Date and Time
dateTime <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Make Plot
png("plot2.png", width=480, height=480)
plot(dateTime, globalpower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()