library(ggplot2)

NEI <- readRDS("/Users/ronibarakventura/Desktop/NEIdata/summarySCC_PM25.rds")
SCC <- readRDS("/Users/ronibarakventura/Desktop/NEIdata/Source_Classification_Code.rds")

CC <- grep("coal",SRC$EI.Sector,value=T,ignore.case=T)
SRCCC <- subset(SRC, SRC$EI.Sector %in% CC, select=SCC)
NEICC <- subset(NEI, NEI$SCC %in%  SRCCC$SCC)
plot4 <- aggregate(NEICC[c("Emissions")], list(year = NEICC$year), sum)


png('plot4.png', width=480, height=480)
p <- ggplot(plot4, aes(x=year, y=Emissions)) +
        geom_point(alpha=.3) +
        geom_smooth(alpha=.2, size=1) +
        ggtitle("Total coal sourced Emissions in the US")
print(p)


dev.off()