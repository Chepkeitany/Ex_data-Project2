
# Load the library to be used
library(ggplot2)

# Load the necessary file provided
NEI <- readRDS("summarySCC_PM25.rds")

# Subset 
NEIBM <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

NEIAggregatedTotalByYearAndFips <- aggregate(Emissions ~ year + fips, NEIBM, sum)
NEIAggregatedTotalByYearAndFips$fips[NEIAggregatedTotalByYearAndFips$fips=="24510"] <- "Baltimore, MD"
NEIAggregatedTotalByYearAndFips$fips[NEIAggregatedTotalByYearAndFips$fips=="06037"] <- "Los Angeles, CA"

png("plot6.png", width=1000, height=500)
g <- ggplot(NEIAggregatedTotalByYearAndFips, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle (type=ON-ROAD) in Baltimore City, MD (fips = "24510") vs Los Angeles, CA (fips = "06037")  1999-2008')
print(g)
dev.off()