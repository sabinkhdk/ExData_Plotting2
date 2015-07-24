## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")
DataBaltimore <- NEI[NEI$fips=="24510",]
TotalEmissionsXyr <- aggregate(Emissions ~ year, DataBaltimore, sum, simplify=TRUE)
# aggregate(expressions, data, function)
png("plot2.png")
barplot(TotalEmissionsXyr$Emissions, names.arg=TotalEmissionsXyr$year, main = "Total P2.5 Emissions by year in Baltimore", xlab="Year", ylab="P2.5 Emissions", col="red")
dev.off()
