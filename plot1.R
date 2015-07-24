## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
TotalEmissionsXyr <- aggregate(Emissions ~ year, NEI, sum, simplify=TRUE)
# aggregate(expressions, data, function)
png("plot1.png")
barplot(TotalEmissionsXyr$Emissions, names.arg=TotalEmissionsXyr$year, main = "Total P2.5 Emissions each year", xlab="Year", ylab="P2.5 Emissions", col="red")
dev.off()
