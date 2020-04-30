png("plot1.png", 480, 480)

hpc <- read.csv2('./household_power_consumption.txt')
hpc$Date = as.Date(hpc$Date, '%d/%m/%Y')
hpc <- hpc[(hpc$Date>='2007-2-1' & hpc$Date<='2007-2-2'),]
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)
hist(hpc$Global_active_power, col='red', xlab = 'Global Active Power (kilowatts)', main='Global Active Power', xlim = c(0,6), ylim=c(0,1200))

dev.off() 
