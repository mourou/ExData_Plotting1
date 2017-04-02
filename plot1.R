library (lubridate)

## read file
household <- read.table("./household_power_consumption.txt", sep=";",header=TRUE, na.strings="?")

## subset data
feb_data <- subset(household, Date=="1/2/2007"|Date=="2/2/2007")

## produce histogram
with(feb_data, hist(Global_active_power, col="red", ylim=c(0,1200), main="Global Active Power", xlab="Global Active Power (kilowatts"))

## write to png file
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()