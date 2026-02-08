data <- read.table("household_power_consumption.txt", 
                   header = TRUE, 
                   sep = ";", 
                   na.strings = "?",
                   colClasses = c("character", "character", rep("numeric", 7)))

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

subset_data <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"), ]

rm(data)

subset_data$DateTime <- strptime(paste(subset_data$Date, subset_data$Time), 
                                 format = "%Y-%m-%d %H:%M:%S")

png("plot2.png", width = 480, height = 480)

plot(subset_data$DateTime, 
     subset_data$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()
