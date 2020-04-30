hpc <- read.csv2('./household_power_consumption.txt')
hpc$Date <- as.Date(hpc$Date, '%d/%m/%Y')
hpc <- hpc[(hpc$Date>='2007-2-1' & hpc$Date<='2007-2-2'),]

hpc$datetime <-strptime(paste(hpc$Date,hpc$Time), "%Y-%m-%d %H:%M:%S")
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)

# 2x2
par(mfcol=c(2,2))

# 1
plot(hpc$datetime, hpc$Global_active_power, type='l', xlab='', ylab='Global Active Power (kilowatt)')

# 2
with(hpc, plot(datetime,Sub_metering_1, col='black', type='l', xlab='', ylab = 'Energy Sub Metering'))
with(hpc, points(datetime,Sub_metering_2, col='red', type='l'))
with(hpc, points(datetime,Sub_metering_3, col='blue', type='l'))

legend("topright", pch = 95, col = c("black", "blue", "red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), box.lty=0)


#3
with(hpc, plot(datetime, Voltage, type='l'))

#4
with(hpc, plot(datetime, Global_reactive_power, type='l'))


dev.copy(png, file = "plot4.png") 
dev.off() 