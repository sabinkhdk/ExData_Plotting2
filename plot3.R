library(ggplot2)
# load data
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")
# Subset data with data from Baltimore city
DataBaltimore <- NEI[NEI$fips=="24510",]
# Total by year by type 
TotalEmissionsXyrXtype <- aggregate(Emissions ~ year + type, DataBaltimore, sum, simplify=TRUE)
# Plot
png("plot3.png")
g1 <- qplot(x=year, y=Emissions, data=TotalEmissionsXyrXtype, geom="line", stat="identity", color = type)
g1 <- g1 + ylab("Total P2.5 Emssions") + ggtitle("Total P2.5 Emissions in Baltimore city by type")
g1 <- g1 + geom_point(color="blue") 
plot(g1)
dev.off()
