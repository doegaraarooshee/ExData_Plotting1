# Load required libraries
library(data.table)

# Read data
data <- fread("household_power_consumption.txt", na.strings = "?", sep = ";")

# Convert Date column to Date type
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset data for dates 2007-02-01 and 2007-02-02
data_subset <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

# Plot 1: Global Active Power Histogram
png("plot1.png", width = 480, height = 480)
hist(
  as.numeric(data_subset$Global_active_power),
  col = "red",
  main = "Global Active Power",
  xlab = "Global Active Power (kilowatts)"
)
dev.off()
