# Exploratory Data Analysis - Project 1
# Plot4.R

# set path
setwd("C:\\Users\\Michael\\Desktop\\R_Codes_Coursera")

# read the data file
HPC <- read.table("household_power_consumption.txt", sep = ";",header = TRUE, na.string = "?")
HPC$Date <- as.Date(HPC, "%d/%m/%Y")   # convert date to dd, mm, yyyy

# create DateTime
HPC$DateTime <- paste(HPC$Date, HPC$Time)
HPC$DateTime <- strptime(HPC$DateTime, "%d/%m/%Y %H:%M:%S")

# imported file using RStudio "Import Dataset" (from Text File)
dat4 <- subset(HPC, Date == "2007-02-01" | Date == "2007-02-02") 
GAP <- as.numeric(as.character(dat4$Global_active_power))
GRP <- as.numeric(as.character(dat4$Global_reactive_power))
Volt <- as.numeric(as.character(dat4$Voltage))
ESM1 <- as.numeric(as.character(dat4$Sub_metering_1))
ESM2 <- as.numeric(as.character(dat4$Sub_metering_2))
ESM3 <- as.numeric(as.character(dat4$Sub_metering_3))

# Define colors to be used for Sub_metering_1, Sub_metering_2, Sub_metering_3
plot_colors <- c("black", "red", "blue")

# 4 figures arranged in 2 rows and 2 columns
png(file = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

# Global active power graph on top left
plot(dat4$DateTime, GAP, type="l", 
     xlab = "",
     ylab="Global Active Power")


# Voltage graph on top right
plot(dat4$DateTime, Volt, type="l", 
     xlab = "datetime",
     ylab="Voltage")


# Energy sub metering graph on bottom left
plot(dat4$DateTime, ESM1, type = "l", col = plot_colors[1],
     xlab = "", ylab = "Energy sub metering")

# Graph Sub_metering_2 with red line 
lines(dat4$DateTime, ESM2, type = "l",  col = plot_colors[2])

# Graph Sub_metering_3 with red line 
lines(dat4$DateTime,ESM3, type = "l",  col = plot_colors[3])

# Create lengend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.8, 
       col=plot_colors, lty = 1, bty = 'n');

# Global reactive power graph on bottom right
plot(dat4$DateTime, GRP, type="l", 
     xlab = "datetime",
     ylab="Global_reactive_power")

dev.off()
