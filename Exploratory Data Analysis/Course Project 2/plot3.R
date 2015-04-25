library(ggplot2)

NEI <- readRDS("/Users/ronibarakventura/Desktop/NEIdata/summarySCC_PM25.rds")

baltimore <- subset(NEI, fips == "24510") 
plot3 <- aggregate(baltimore[c("Emissions")], 
                      list(type=baltimore$type, year = baltimore$year), sum)

png('plot3.png', width=480, height=480)

p <- ggplot(plot3, aes(x=year, y=Emissions, colour=type)) +
        geom_point(alpha=0.1) +
        geom_smooth(method="loess") +
        ggtitle("Total PM2.5 Emissions in Baltimore by Type")
print(p)

dev.off()