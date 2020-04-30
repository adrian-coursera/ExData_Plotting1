hpc <- read.csv2('./household_power_consumption.txt')
hpc$Date <- as.Date(hpc$Date, '%d/%m/%Y')
hpc <- hpc[(hpc$Date>='2007-2-1' & hpc$Date<='2007-2-2'),]

hpc$datetimes <-strptime(paste(hpc$Date,hpc$Time), "%Y-%m-%d %H:%M:%S")
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)

with(hpc, plot(datetimes,Sub_metering_1, col='black', type='l', xlab='', ylab = 'Energy Sub Metering'))
with(hpc, points(datetimes,Sub_metering_2, col='red', type='l'))
with(hpc, points(datetimes,Sub_metering_3, col='blue', type='l'))

legend("topright", pch = 95, col = c("black", "blue", "red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png, file = "plot3.png") 
dev.off() 