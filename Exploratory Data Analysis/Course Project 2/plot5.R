library(ggplot2)

NEI <- readRDS("/Users/ronibarakventura/Desktop/NEIdata/summarySCC_PM25.rds")
SCC <- readRDS("/Users/ronibarakventura/Desktop/NEIdata/Source_Classification_Code.rds")

baltimore <- subset(NEI, fips == "24510")
vehicle <- SCC[grepl("Vehicle", SCC$EI.Sector),]
baltimorevehicle <- subset(baltimore, baltimore$SCC %in% vehicle$SCC)


plot5 <- aggregate(baltimorevehicle[c("Emissions")], 
                      list(type=baltimorevehicle$type, 
                           year = baltimorevehicle$year), sum)

png('plot5.png', width=480, height=480)

p <- ggplot(plot5, aes(x=year, y=Emissions, colour=type)) +
        geom_point(alpha=0.1) +
        geom_smooth(method="loess") +
        ggtitle("Total Vehicle Emissions in Baltimore")
print(p)

dev.off()