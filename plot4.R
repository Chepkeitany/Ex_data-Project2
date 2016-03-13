# Load the library needed
library(ggplot2)

# Load the two files provided
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Merge the two datasets
NEISCC <- merge(NEI, SCC, by="SCC")

# Coal combustion related sources
NEISCCCoal <- NEISCC[grepl("coal", NEISCC$Short.Name, ignore.case=TRUE), ]

# Aggregate
NEIAggregatedTotalByYear <-  aggregate(Emissions ~ year, NEISCCCoal, sum)

# Disable scientific notation in R
options(scipen = 999)

# Create a device
png(filename="plot4.png", width = 800, height = 500, units ='px')

#Make the plot
g <- ggplot(NEIAggregatedTotalByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from coal sources from 1999 to 2008')
print(g)

# Close the device
dev.off()

