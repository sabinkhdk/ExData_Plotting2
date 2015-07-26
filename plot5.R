library(ggplot2)
# load data
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")
# Subset of NEI with motor vehicle emission (type = ON ROAD) in Baltimore city
SubsetMVehicleBC <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",]
MVehicleEmissionsXyr <- aggregate(Emissions ~ year, SubsetMVehicleBC, sum, simplify=TRUE)
png("plot5.png")
p1 <- qplot(x=year, y=Emissions, data=MVehicleEmissionsXyr, geom="line", stat="identity")
p1 <- p1 + xlab("year") + ylab("Total P2.5 Emissions") + expand_limits(y=0)
p1 <- p1 + geom_point(color="blue") + geom_line(color="red") + ggtitle("P2.5 Emission in from motor vehicle in Baltimore City by year")
print(p1)
dev.off()
