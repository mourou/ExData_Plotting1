library (lubridate)

## read file
household <- read.table("./household_power_consumption.txt", sep=";",header=TRUE, na.strings="?")

## subset data
feb_data <- subset(household, Date=="1/2/2007"|Date=="2/2/2007")

## add datetime column
feb_data$DateTime <- with(feb_data, paste(Date, Time))
feb_data$DateTime <- dmy_hms(feb_data$DateTime)

## change to English locale
Sys.setlocale("LC_TIME", "English")

## produce plot
with(feb_data, plot(DateTime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))

## write to png file
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()