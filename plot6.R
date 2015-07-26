library(ggplot2)
# load data
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")
# Subset of NEI with motor vehicle emission (type = ON ROAD) in Baltimore city and Los Angeles
SubsetMVehicleBC_LA <- NEI[(NEI$fips=="24510" | NEI$fips=="06037") & NEI$type=="ON-ROAD",]
MVehicleEmissionsXyrXCity <- aggregate(Emissions ~ year + fips, SubsetMVehicleBC_LA, sum, simplify=TRUE)
# Plot
png("plot6.png")
p1 <- qplot(x=year, y=Emissions, data=MVehicleEmissionsXyrXCity, geom="line", stat="identity", 
            color = fips)
p1 <- p1 + xlab("year") + ylab("Total P2.5 Emissions") + expand_limits(y=0)
p1 <- p1 + geom_point(color="blue") 
p1 <- p1 + ggtitle("P2.5 Emission from motor vehicle in \nBaltimore & Los-Angeles City by year")
p1 <- p1 + scale_color_discrete(name="City", breaks=c("06037", "24510"),
                                labels=c("Los-Angeles", "Baltimore"))
print(p1)
dev.off()
