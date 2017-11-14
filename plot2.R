hpc <- read.csv("household_power_consumption.txt", sep=";", as.is=T, na.strings = c("?"))

library(lubridate)

hpc$DateTime <- force_tz(dmy_hms(paste(hpc$Date, hpc$Time)))

hpc$Date <- dmy(hpc$Date)

hpc<- hpc[hpc$DateTime >= "2007-02-01 00:00:00" & hpc$DateTime < "2007-02-03 00:00:00" & !is.na(hpc$DateTime),]

par(mfcol=c(1,1))

plot(hpc$DateTime, hpc$Global_active_power, type="l",xlab = "", ylab = "Global Active Power (kilowatts)")

dev.copy(png, filename = "plot2.png")

dev.off()