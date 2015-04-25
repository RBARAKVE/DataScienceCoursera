NEI <- readRDS("/Users/ronibarakventura/Desktop/NEIdata/summarySCC_PM25.rds")


plot1 <- aggregate(NEI[c("Emissions")], list(year = NEI$year), sum)

png('plot1.png', width=480, height=480)
plot(plot1$year, plot1$Emissions, type = "l", 
     main = "Total PM2.5 Emission in the US",
     xlab = "Year", ylab = "Emissions")


dev.off()
