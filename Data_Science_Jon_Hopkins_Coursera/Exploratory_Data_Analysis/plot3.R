##import the file and restrict to two days in feb
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE,dec=".")
dfsubset <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]

#make the plot and save to plot2.png with seperate days instead of months
datetimesep <- strptime(paste(dfsubset$Date, dfsubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GlobalActivePowerDayUsage <- as.numeric(dfsubset$Global_active_power)
submetering1 <- as.numeric(dfsubset$Sub_metering_1)
submetering2 <- as.numeric(dfsubset$Sub_metering_2)
submetering3 <- as.numeric(dfsubset$Sub_metering_3)

#specify dimensions, and plot original data with first metering and add the other two metering lines
png("plot3.png", width=480, height=480)
plot(datetimesep, submetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetimesep, submetering2, type="l", col="red")
lines(datetimesep, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
