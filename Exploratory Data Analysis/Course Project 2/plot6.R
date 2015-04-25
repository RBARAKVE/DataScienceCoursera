library(ggplot2)

NEI <- readRDS("/Users/ronibarakventura/Desktop/NEIdata/summarySCC_PM25.rds")
SCC <- readRDS("/Users/ronibarakventura/Desktop/NEIdata/Source_Classification_Code.rds")

NEIbala <- subset(NEI, fips == "24510" | fips == "06037")
vehicle <- SCC[grepl("Vehicle", SCC$EI.Sector),]
balavehicle <- subset(NEIbala, NEIbala$SCC %in% vehicle$SCC)

balavehicle$city <- rep(NA, nrow(balavehicle))
balavehicle[balavehicle$fips == "06037", ][, "city"] <- "Los Angeles County"
balavehicle[balavehicle$fips == "24510", ][, "city"] <- "Baltimore City"

plot6 <- aggregate(balavehicle[c("Emissions")], 
                      list(city = balavehicle$city, 
                           year = balavehicle$year), sum)

png('plot6.png', width=480, height=480)
p <- ggplot(plot6, aes(x=year, y=Emissions, colour=city)) +
        geom_point(alpha=0.1) +
        geom_smooth(method="loess") +
        ggtitle("Vehicle Emissions in Baltimore and Los Angeles")
print(p)

dev.off()