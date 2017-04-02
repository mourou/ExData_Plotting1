library (lubridate)

## read file
household <- read.table("./household_power_consumption.txt", sep=";",header=TRUE, na.strings="?")

## subset data
feb_data <- subset(household, Date=="1/2/2007"|Date=="2/2/2007")

## add datetime column
feb_data$DateTime <- with(feb_data, paste(Date, Time))
feb_data$DateTime <- dmy_hms(feb_data$DateTime)

## change locale to English
Sys.setlocale("LC_TIME", "English")

## produce plot for sub metering 1
with(feb_data, plot(DateTime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
## add sub metering 2
with(feb_data, lines(DateTime, Sub_metering_2, col="red"))
## add sub metering 3
with(feb_data, lines(DateTime, Sub_metering_3, col="blue"))
## add legend
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)

## write to png file
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()