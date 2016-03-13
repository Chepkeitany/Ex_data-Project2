# Load the library needed
library(ggplot2)

# Load the necessary file provided
NEI <- readRDS("summarySCC_PM25.rds")

# Subset for Baltimore City and Maryland 
NEIVehicles <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

# Aggregate
NEIAggregatedTotalByYear <- aggregate(Emissions ~ year, NEIVehicles, sum)

png("plot5.png", width=800, height=500)
g <- ggplot(NEIAggregatedTotalByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle sources in Baltimore City, Maryland from 1999 to 2008')
print(g)
dev.off()