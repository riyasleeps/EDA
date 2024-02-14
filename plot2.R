plot2 <- function(){

  power_data <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep = ";")
  combined_datetime <- strptime(paste(power_data$Date, power_data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
  power_data <- cbind(power_data, combined_datetime)


  power_data$Date <- as.Date(power_data$Date, format = "%d/%m/%Y")
  power_data$Time <- format(power_data$Time, format = "%H:%M:%S")


  power_data$Global_active_power <- as.numeric(power_data$Global_active_power)
  power_data$Global_reactive_power <- as.numeric(power_data$Global_reactive_power)
  power_data$Voltage <- as.numeric(power_data$Voltage)
  power_data$Global_intensity <- as.numeric(power_data$Global_intensity)

  power_data$Sub_metering_1 <- as.numeric(power_data$Sub_metering_1)
  power_data$Sub_metering_2 <- as.numeric(power_data$Sub_metering_2)
  power_data$Sub_metering_3 <- as.numeric(power_data$Sub_metering_3)
  subset_data <- subset(power_data, Date == "2007-02-01" | Date == "2007-02-02")

  png("plot2.png", width = 480, height = 480)
  plot(subset_data$combined_datetime, subset_data$Global_active_power, type = "l", xlab = "Date", ylab = "Global Active Power (kilowatts)")
  dev.off()
}
