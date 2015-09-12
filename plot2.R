# Plot 2 - Global Active Power line chart by weekday

# read in the data from the current directory
raw <- read.table("household_power_consumption.txt", colClasses=c("Date" = "character", "Time" = "character", "Global_active_power" = "numeric", "Global_reactive_power" = "numeric", "Voltage" = "numeric", "Global_intensity" = "numeric", "Sub_metering_1" = "numeric", "Sub_metering_2" = "numeric", "Sub_metering_3" = "numeric"), sep=";", header = TRUE, na.strings = "?")

# subset the data by dates (1st & 2nd Feb 2007) and get the date and Global Active Power column
hpc <- subset(raw, as.Date(Date, "%d/%m/%Y") == "2007-02-01" | as.Date(Date, "%d/%m/%Y") == "2007-02-02", select=c(Global_active_power, Date, Time))

# convert the text date of the subsetted data to an actual date format
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")

# get a reference to the png file to create
png(file = "plot2.png")

# plot the "empty" chart (no points) from the date and time data by global active power (for the subset)
plot(as.POSIXct(paste(hpc$Date, hpc$Time, sep = " ")), hpc$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")

# add the lines to the "empty" chart for date and time by global active power
lines(as.POSIXct(paste(hpc$Date, hpc$Time, sep = " ")), hpc$Global_active_power)

dev.off()
