hpc <- read.csv("household_power_consumption.txt", sep=";", as.is=T, na.strings = c("?"))

library(lubridate)

hpc$Date <- dmy(hpc$Date)

hpc <- hpc[hpc$Date == "2007-02-02" | hpc$Date == "2007-02-01",]

par(mfcol=c(1,1))

hist(hpc$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.copy(png, filename = "plot1.png")

dev.off()