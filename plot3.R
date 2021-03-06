###########################################################################
## Exploratory data analysis - Course project 1 - plot2
###########################################################################

# Data --------------------------------------------------------------------

tmp.df <- 
  read.table(file = "https://raw.githubusercontent.com/filippogheri/ExData_Plotting1/master/household_power_consumption.txt",
             header = TRUE, stringsAsFactors = FALSE, sep = ";")
tmp.df <- subset(tmp.df, Date %in% c("1/2/2007", "2/2/2007"))
tmp.df[, "Date"] <- as.Date(tmp.df[, "Date"], format = c("%d/%m/%Y"))
tmp.df[, "Global_active_power"] <- as.numeric(tmp.df[, "Global_active_power"])
tmp.df[, "Global_reactive_power"] <- as.numeric(tmp.df[, "Global_reactive_power"])
tmp.df[, "Voltage"] <- as.numeric(tmp.df[, "Voltage"])
tmp.df[, "Global_intensity"] <- as.numeric(tmp.df[, "Global_intensity"])
tmp.df[, "Sub_metering_1"] <- as.numeric(tmp.df[, "Sub_metering_1"])
tmp.df[, "Sub_metering_2"] <- as.numeric(tmp.df[, "Sub_metering_2"])
tmp.df[, "DateTime"] <- 
  as.POSIXct(paste(tmp.df[, "Date"], tmp.df[, "Time"]),tz=Sys.timezone())

# plot3 -------------------------------------------------------------------

png("plot3.png", width = 480, height = 480)
plot(tmp.df[, "DateTime"], tmp.df[, "Sub_metering_1"], type = "l",
     ylab = "Energy sub metering", xlab = "")
lines(tmp.df[, "DateTime"], tmp.df[, "Sub_metering_2"], col = "red")
lines(tmp.df[, "DateTime"], tmp.df[, "Sub_metering_3"], col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1)
dev.off()