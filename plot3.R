# Exploratory Data Analysis - Project 1
# Plot3.R

# set path
setwd("C:\\Users\\Michael\\Desktop\\R_Codes_Coursera")

# read the data file
HPC <- read.table("household_power_consumption.txt", sep = ";",header = TRUE, na.string = "?")




# create DateTime
HPC$DateTime <- paste(HPC$Date, HPC$Time)
HPC$DateTime <- strptime(HPC$DateTime, "%d/%m/%Y %H:%M:%S")

# imported file using RStudio "Import Dataset" (from Text File)
HPC$Date <- as.Date(HPC$Date, "%d/%m/%Y")
dat4 <- subset(HPC, Date == "2007-02-01" | Date == "2007-02-02") 


# Define colors to be used for Sub_metering_1, Sub_metering_2, Sub_metering_3
plot_colors <- c("black", "red", "blue")

# Plot3
png(file = "plot3.png", width = 480, height = 480)
plot(dat4$DateTime, dat4$Sub_metering_1, type="l",
     xlab = "", ylab="Energy sub metering", col = plot_colors[1])


# Graph Sub_metering_2 with red line 
lines(dat4$DateTime, dat4$Sub_metering_2, type = "l",  col = plot_colors[2])

# Graph Sub_metering_3 with red line 
lines(dat4$DateTime, dat4$Sub_metering_3, type = "l",  col = plot_colors[3])


# Create lengend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.8, 
       col=plot_colors, lty = 1);

dev.off()