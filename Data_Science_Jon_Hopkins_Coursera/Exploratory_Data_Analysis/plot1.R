##import the file and restrict to two days in feb
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE,dec=".")
dfsubset <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]

#make the plot and save to plot1.png with specified dimensions
GlobalActivePower <- as.numeric(dfsubset$Global_active_power)
png("plot1.png", width=480, height=480)
hist(GlobalActivePower, col="orange", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

