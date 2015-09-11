# Plot 1 - Global Active Power histogram

# read in the data from the current directory
raw <- read.table("household_power_consumption.txt", colClasses=c("Date" = "character", "Time" = "character", "Global_active_power" = "numeric", "Global_reactive_power" = "numeric", "Voltage" = "numeric", "Global_intensity" = "numeric", "Sub_metering_1" = "numeric", "Sub_metering_2" = "numeric", "Sub_metering_3" = "numeric"), sep=";", header = TRUE, na.strings = "?")

# subset the data by dates (1st & 2nd Feb 2007) and get the Global Active Power column
hpc <- subset(raw, as.Date(Date, "%d/%m/%Y") == "2007-02-01" | as.Date(Date, "%d/%m/%Y") == "2007-02-02", select=c(Global_active_power))

# plot a histogram of the Global Active Power subsetted data by frequency to the PNG graphics device
png(file = "plot1.png")
hist(hpc$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()