# Load the two files provided
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset NEI where fips = 24510
NEIBM <- subset(NEI, fips=='24510')

# Aggregate
NEIAggregatedByYear <- aggregate(Emissions ~ year, NEIBM, sum)

# Disable scientific notation in R
options(scipen = 999)

# Create a graphics device
png("plot2.png")

# Make the plot using the base plotting system
barplot(NEIAggregatedByYear$Emissions, names.arg=NEIAggregatedByYear$year, 
        main=expression('Total Emission of PM in Baltimore City, MD'),
        xlab='Year', ylab=expression(paste('PM', ''[2.5])))
# Close the device
dev.off()


