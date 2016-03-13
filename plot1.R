# Load the two files provided
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Aggregate
NEIAggregatedByYear <- aggregate(Emissions ~ year, NEI, sum)
# Disable scientific notation in R
options(scipen = 999)
# Create a device
png("plot1.png")
# Make the plot using the base plotting system
barplot(NEIAggregatedByYear$Emissions, names.arg=NEIAggregatedByYear$year, 
        main=expression('Total Emission of PM'[2.5]),
        xlab='Year', ylab=expression(paste('PM', ''[2.5])))

# Close the device
dev.off()
