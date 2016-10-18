##import the file and restrict to two days in feb
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE,dec=".")
dfsubset <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]

#make the plot and save to plot2.png with specified dimensions and seperate months from days
datetimesep <- strptime(paste(dfsubset$Date, dfsubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GlobalActivePowerDayUsage <- as.numeric(dfsubset$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetimesep, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
