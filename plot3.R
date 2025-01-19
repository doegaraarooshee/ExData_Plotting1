# Load required library
library(data.table)

# Read data
data <- fread("household_power_consumption.txt", na.strings = "?", sep = ";")

# Convert Date and Time columns to a datetime object
data$Datetime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

# Subset data for the required dates
data_subset <- subset(data, as.Date(Datetime) >= as.Date("2007-02-01") & as.Date(Datetime) <= as.Date("2007-02-02"))

# Plot 3: Energy sub-metering
png("plot3.png", width = 480, height = 480)
plot(
  data_subset$Datetime,
  as.numeric(data_subset$Sub_metering_1),
  type = "l",
  xlab = "",
  ylab = "Energy sub metering",
  col = "black"
)
lines(data_subset$Datetime, as.numeric(data_subset$Sub_metering_2), col = "red")
lines(data_subset$Datetime, as.numeric(data_subset$Sub_metering_3), col = "blue")
legend(
  "topright",
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  col = c("black", "red", "blue"),
  lty = 1
)
dev.off()
