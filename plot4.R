library(ggplot2)
# load data
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")
# match coal combustion records in Short.Name
SCC.coal <- SCC[grepl("coal" , SCC$Short.Name, ignore.case=TRUE),]
# merge two datasets
mergeSubsetCoal <- merge(NEI, SCC.coal, by="SCC")
CoalEmissionsXyr <- aggregate(Emissions ~ year, mergeSubsetCoal, sum, simplify=TRUE)
# aggregate(expressions, data, function)
# plot
png("plot4.png")
p1 <- ggplot(data = CoalEmissionsXyr, aes(factor(year), Emissions, group=1)) 
p1 <- p1 + xlab("year") + ylab("Total P2.5 Emissions") + expand_limits(y=0)
p1 <- p1 + geom_point(color="blue") + geom_line(color="red") + ggtitle("Total P2.5 Emission across America due to coal by year")
print(p1)
dev.off()
