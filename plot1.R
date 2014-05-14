
# Exploratory Data Analysis - Project 1
#Plot1.R

#set path
setwd("C:\\Users\\Michael\\Desktop\\R_Codes_Coursera")

#read the data file
HPC <- read.table("household_power_consumption.txt", sep=";",header=TRUE, na.string = "?")


#imported file using RStudio "Import Dataset" (from Text File)
HPC$DateTime<-paste(HPC$Date, HPC$Time, sep = " ")
HPC$DateTime<-strptime(HPC$DateTime, "%d/%m/%Y %H:%M:%S")

HPC$Date <- as.Date(HPC$Date, "%d/%m/%Y")
dat4 <- subset(HPC, Date =="2007-02-01" | Date =="2007-02-02") 
GAP <- as.numeric(as.character(dat4$Global_active_power))

#plot1
png(file = "plot1.png", width=480, height=480)
hist(GAP, col = "red",
     main = "Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency")

dev.off()