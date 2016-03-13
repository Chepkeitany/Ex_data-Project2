
# Load the library needed
library(ggplot2)

# Load the two files provided
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Baltimore City, Maryland == fips
NEIBM <- subset(NEI, fips == 24510)

# Aggregate
NEIBMAggregatedByYearAndType <- aggregate(Emissions ~ year + type, NEIBM, sum)

# Disable scientific notation in R
options(scipen = 999)

# Create a device
png(filename="plot3.png", width = 800, height = 500, units ='px')

g <- ggplot(NEIBMAggregatedByYearAndType, aes(year, Emissions, color = type))
g <- g + geom_line() +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions in Baltimore City, Maryland')
print(g)

# Close the device
dev.off()