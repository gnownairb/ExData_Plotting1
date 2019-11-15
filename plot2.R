library(dplyr)

power_consumption <- read.table("household_power_consumption.txt", T, sep = ";", dec = ".", stringsAsFactors = FALSE, na.strings = "?") 
power_consumption$Date <- as.Date(power_consumption$Date, "%d/%m/%Y")
power_consumption$date_time <- as.POSIXct(paste(power_consumption$Date, power_consumption$Time), format="%Y-%m-%d %H:%M:%S")
str(power_consumption)
dim(power_consumption)
head(power_consumption)

class(power_consumption$date_time)

powerdata <- filter(power_consumption, Date >= "2007-02-01", Date <= "2007-02-02")

# Plot 2 Reconstruction
with(powerdata, plot(date_time, Global_active_power, xlab = "" ,ylab = "Global Active Power (kilowatts)", type = "l", ))
table(weekdays(powerdata$Date))
dev.cur()
dev.copy(png, file = "plot2.png")
dev.off()