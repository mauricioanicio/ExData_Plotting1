hpc <- read.csv("household_power_consumption.txt", sep=";", as.is=T, na.strings = c("?"))

library(lubridate)

hpc$DateTime <- force_tz(dmy_hms(paste(hpc$Date, hpc$Time)))

hpc$Date <- dmy(hpc$Date)

hpc<- hpc[hpc$DateTime >= "2007-02-01 00:00:00" & hpc$DateTime < "2007-02-03 00:00:00" & !is.na(hpc$DateTime),]

par(mfcol=c(1,1))

plot(hpc$DateTime, hpc$Sub_metering_1, type="n", ylab = "Energy sub metering", xlab = "")
lines(hpc$DateTime, hpc$Sub_metering_1, col = "black")
lines(hpc$DateTime, hpc$Sub_metering_2, col = "red")
lines(hpc$DateTime, hpc$Sub_metering_3, col = "blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

dev.copy(png, filename = "plot3.png")

dev.off()