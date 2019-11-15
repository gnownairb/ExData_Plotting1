library(dplyr)

power_consumption <- read.table("household_power_consumption.txt", T, sep = ";", dec = ".", stringsAsFactors = FALSE, na.strings = "?") 
power_consumption$Date <- as.Date(power_consumption$Date, "%d/%m/%Y")
power_consumption$date_time <- as.POSIXct(paste(power_consumption$Date, power_consumption$Time), format="%Y-%m-%d %H:%M:%S")
str(power_consumption)
dim(power_consumption)
head(power_consumption)

class(power_consumption$date_time)

powerdata <- filter(power_consumption, Date >= "2007-02-01", Date <= "2007-02-02")

# Plot 3 Reconstruction
with(powerdata, plot(date_time, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l"))
lines(powerdata$date_time, powerdata$Sub_metering_2, col = "red", type = "l")     
lines(powerdata$date_time, powerdata$Sub_metering_3, col = "blue", type = "l")     
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, cex = 0.5)
dev.cur()
dev.copy(png, file = "plot3.png")
dev.off()