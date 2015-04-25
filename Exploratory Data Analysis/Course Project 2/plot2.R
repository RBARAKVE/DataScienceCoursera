NEI <- readRDS("/Users/ronibarakventura/Desktop/NEIdata/summarySCC_PM25.rds")
baltimore <- subset(NEI, fips == "24510")

plot2 <- aggregate(baltimore[c("Emissions")], list(year = baltimore$year), sum)

png('plot2.png', width=480, height=480)
plot(plot2$year, plot2$Emissions, type = "l", 
     main = "Total PM2.5 Emission in Baltimore",
     xlab = "Year", ylab = "Emissions")

dev.off()