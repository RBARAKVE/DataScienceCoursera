alldata <- read.csv("/Users/ronibarakventura/Desktop/household_power_consumption.txt", header=T, sep=';', na.strings="?")
alldata$Date <- as.Date(alldata$Date, format="%d/%m/%Y")

subdata <- subset(alldata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)

plot(subdata$Global_active_power~subdata$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()