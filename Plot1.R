setwd("C:\\Users\\bmerr\\Documents\\eLearning\\Data Science\\Johns Hopkins\\Course 4 Exploratory Data Analysis\\Course 4 Working Directory")
## read in data from "Electric power consumption"
power_data <- "household_power_consumption.txt"
all_power_data <- read.table(power_data,header = TRUE, sep =  ";", dec = ".",na.strings = "?")
## file graph as
png(filename = "plot1.png")
sub_power_data<- all_power_data[all_power_data$Date %in% c("1/2/2007","2/2/2007"),]
hist(sub_power_data$Global_active_power, 
     col="red",main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()