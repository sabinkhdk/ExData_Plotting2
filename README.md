# ExData_Plotting2
Exploratory data analysis course project 2
07/23/15:
Files for plot 1: 
plot1.R: Function used# aggregate(expressions, data, function)
plots plot1.png: bar plot of total P2.5 Emissions each year
Plot2.R: Similar plot of data from Baltimore city only.
Make subset of Data from Baltimore city fibs="24510"
plot3.R: Total P2.5 emission per yr by type 
    use qplot
plot4.R: Coal combustion related emissions across America
    # match coal combustion records in Short.Name
    SCC.coal <- SCC[grepl("coal" , SCC$Short.Name, ignore.case=TRUE),]
    merge two datasets
    # merge two datasets
    mergeSubsetCoal <- merge(NEI, SCC.coal, by="SCC")
plot5.R: emissions from motor vehicle sources changed from 1999–2008 in Baltimore City
    # Subset of NEI with motor vehicle emission (type = ON ROAD) in Baltimore city
    SubsetMVehicleBC <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",]
plot6.R: emissions from motor vehicle sources in Baltimore City with emissions from motor
     vehicle sources in Los Angeles County, California
     # Subset of NEI with motor vehicle emission (type = ON ROAD) in Baltimore city and Los Angeles
    SubsetMVehicleBC_LA <- NEI[(NEI$fips=="24510" | NEI$fips=="06037") & NEI$type=="ON-ROAD",]

