#Read Data
data <- read.table("household_power_consumption.txt", header=TRUE, stringsAsFactors=FALSE,sep=";")

#Subset Data
subsetData<-subset(data, Date=="1/2/2007" | Date=="2/2/2007")

#Convert Global Active Power to Numeric
globalpower <- as.numeric(subsetData$Global_active_power)

#Make Plot
png("plot1.png", width=480, height=480)
hist(globalpower, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()