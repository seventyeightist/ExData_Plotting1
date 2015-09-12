# Plot 4 - Variables across time - Global Active Power, Global Reactive Power, Voltage, Energy Sub Metering 1/2/3

# read in the data from the current directory
raw <- read.table("household_power_consumption.txt", colClasses=c("Date" = "character", "Time" = "character", "Global_active_power" = "numeric", "Global_reactive_power" = "numeric", "Voltage" = "numeric", "Global_intensity" = "numeric", "Sub_metering_1" = "numeric", "Sub_metering_2" = "numeric", "Sub_metering_3" = "numeric"), sep=";", header = TRUE, na.strings = "?")

# subset the data by dates (1st & 2nd Feb 2007) and get the date and sub metering columns
hpc <- subset(raw, as.Date(Date, "%d/%m/%Y") == "2007-02-01" | as.Date(Date, "%d/%m/%Y") == "2007-02-02")

# convert the text date of the subsetted data to an actual date format
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")

# I add a datetime field to this one as we will re-use it many times
hpc$datetime <- as.POSIXct(paste(hpc$Date, hpc$Time, sep = " "))

# get a reference to the png file to create
png(file = "plot4.png")

# we want a 2 x 2 "grid" of plots so set the rows and columns accordingly. Fill across then down
par(mfrow = c(2,2))


with (hpc,

{
# first plot - global active power x time
plot(datetime, Global_active_power, type = "n", xlab = "", ylab = "Global Active Power")
lines(datetime, Global_active_power)

# second plot - voltage x time
plot(datetime, Voltage, type = "n")
lines(datetime, Voltage)

# third plot - energy sub metering 1/2/3 x time as it was done for plot 3
plot(datetime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(datetime, Sub_metering_1)
lines(datetime, Sub_metering_2, col = "red")
lines(datetime, Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = c(1,1,1), bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# fourth plot - global reactive power x time
plot(datetime, Global_reactive_power, type = "n")
lines(datetime, Global_reactive_power)
}
)

dev.off()
