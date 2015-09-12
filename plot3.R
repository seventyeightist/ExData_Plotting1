# Plot 3 - Energy Sub Metering 1, 2 & 3 line chart by weekday

# read in the data from the current directory
raw <- read.table("household_power_consumption.txt", colClasses=c("Date" = "character", "Time" = "character", "Global_active_power" = "numeric", "Global_reactive_power" = "numeric", "Voltage" = "numeric", "Global_intensity" = "numeric", "Sub_metering_1" = "numeric", "Sub_metering_2" = "numeric", "Sub_metering_3" = "numeric"), sep=";", header = TRUE, na.strings = "?")

# subset the data by dates (1st & 2nd Feb 2007) and get the date and sub metering columns
hpc <- subset(raw, as.Date(Date, "%d/%m/%Y") == "2007-02-01" | as.Date(Date, "%d/%m/%Y") == "2007-02-02", select=c(Sub_metering_1, Sub_metering_2, Sub_metering_3, Date, Time))

# convert the text date of the subsetted data to an actual date format
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")

# get a reference to the png file to create
png(file = "plot3.png")

# plot the "empty" chart (no points) from the date and time data by energy sub metering
plot(as.POSIXct(paste(hpc$Date, hpc$Time, sep = " ")), hpc$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")

# add the lines to the "empty" chart for date and time by energy sub metering1, 2 and 3
lines(as.POSIXct(paste(hpc$Date, hpc$Time, sep = " ")), hpc$Sub_metering_1)
lines(as.POSIXct(paste(hpc$Date, hpc$Time, sep = " ")), hpc$Sub_metering_2, col = "red")
lines(as.POSIXct(paste(hpc$Date, hpc$Time, sep = " ")), hpc$Sub_metering_3, col = "blue")

# put on the legend - top right, colours = black/red/blue as per the lines above, line type 1 (line), series sub metering 1/2/3
legend("topright", col = c("black", "red", "blue"), lty = c(1,1,1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
