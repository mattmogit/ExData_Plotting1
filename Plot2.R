#----------------------p2
data <- read.csv("E:/Downloads/household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
sub <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)

datetime <- paste(as.Date(sub$Date), sub$Time)
sub$Datetime <- as.POSIXct(datetime)

## Plot 2
png(filename = "plot2.png", bg = "white")
plot(sub$Global_active_power~sub$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
rm(sub)
