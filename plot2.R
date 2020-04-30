png("plot2.png", 480, 480)

hpc <- read.csv2('./household_power_consumption.txt')
hpc$Date <- as.Date(hpc$Date, '%d/%m/%Y')
hpc <- hpc[(hpc$Date>='2007-2-1' & hpc$Date<='2007-2-2'),]
hpc$datetimes <-strptime(paste(hpc$Date,hpc$Time), "%Y-%m-%d %H:%M:%S")
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)
plot(hpc$datetimes, hpc$Global_active_power, type='l', xlab='', ylab='Global Active Power (kilowatt)')

dev.off() 
