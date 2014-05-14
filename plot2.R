
# Exploratory Data Analysis - Project 1
# Plot2.R

#set path
setwd("C:\\Users\\Michael\\Desktop\\R_Codes_Coursera")

#read the data file
HPC <- read.table("household_power_consumption.txt", sep = ";",header = TRUE, na.string = "?")
HPC$Date <- as.Date(HPC, "%d/%m/%Y")   # convert date to dd, mm, yyyy

#create DateTime
HPC$DateTime <- paste(HPC$Date, HPC$Time)
HPC$DateTime <- strptime(HPC$DateTime, "%d/%m/%Y %H:%M:%S")
        
#imported file using RStudio "Import Dataset" (from Text File)
dat4 <- subset(HPC, Date == "2007-02-01" | Date == "2007-02-02") 
GAP <- as.numeric(as.character(dat4$Global_active_power))


#plot2
png(file = "plot2.png", width = 480, height = 480)
plot(dat4$DateTime, GAP, type="l", 
     xlab = "",
     ylab="Global Active Power (killowatts)")
dev.off()
