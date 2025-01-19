# Load required library
library(data.table)

# Read data
data <- fread("household_power_consumption.txt", na.strings = "?", sep = ";")

# Convert Date and Time columns to a datetime object
data$Datetime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

# Subset data for the required dates
data_subset <- subset(data, as.Date(Datetime) >= as.Date("2007-02-01") & as.Date(Datetime) <= as.Date("2007-02-02"))

# Plot 2: Line plot of Global Active Power
png("plot2.png", width = 480, height = 480)
plot(
  data_subset$Datetime,
  as.numeric(data_subset$Global_active_power),
  type = "l",
  xlab = "",
  ylab = "Global Active Power (kilowatts)",
  main = "Global Active Power Over Time"
)
dev.off()
