##import the file and restrict to two days in feb
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE,dec=".")
dfsubset <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]

#make the plot and save to plot2.png with seperate days instead of months
datetimesep <- strptime(paste(dfsubset$Date, dfsubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GlobalActivePowerDayUsage <- as.numeric(dfsubset$Global_active_power)
GlobalReactivePower <- as.numeric(dfsubset$Global_reactive_power)
Voltage <- as.numeric(dfsubset$Voltage)
submetering1 <- as.numeric(dfsubset$Sub_metering_1)
submetering2 <- as.numeric(dfsubset$Sub_metering_2)
submetering3 <- as.numeric(dfsubset$Sub_metering_3)

#make the plot4.png with dimensions, and change the display to be 2x2 so there will be 4 charts
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

##plotting plot2 first in the top left
plot(datetimesep, GlobalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

##plotting Voltage use in the top right
plot(datetimesep, Voltage, type="l", xlab="datetime", ylab="Voltage")

##plotting plot3 in the bottom left
plot(datetimesep, submetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetimesep, submetering2, type="l", col="red")
lines(datetimesep, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

#plotting Global Reactive Power in the bottom right
plot(datetimesep, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
