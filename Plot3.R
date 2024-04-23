setwd("C:\\Users\\bmerr\\Documents\\eLearning\\Data Science\\Johns Hopkins\\Course 4 Exploratory Data Analysis\\Course 4 Working Directory")
library(lubridate)
library(dplyr)
library(data.table)
## read in data from "Household ppower consumption"
power_data <- "household_power_consumption.txt"
all_power_data <- read.table(power_data, header = TRUE,sep = ";",dec = ".",na.strings = "?",)

## subset data for selected dates Feb 1 2007 and Feb 2 2007.
row1 <- 66638L
row2 <- 69517L
sub_data <- all_power_data[row1:row2,]
## combine dates and times for one needed plot x data
sub_data$plot_col <- dmy_hms(paste(sub_data$Date,sub_data$Time))

## file graph as plot3.png
png(filename = "plot3.png")
## create plot date/time vs 3 sub metering data
plot(sub_data$plot_col, sub_data$Sub_metering_1, type ="l", 
     col = "black",
     xlab = " ",
     ylab ="Energy sub metering",
     xaxt = "n")
## add second set
lines(## combine dates and times for one needed plot x data
  sub_data$plot_col, sub_data$Sub_metering_2, col = "red")
lines(## combine dates and times for one needed plot x data
  sub_data$plot_col, sub_data$Sub_metering_3, col = "blue")
legend(1, x = "topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lwd=2.5, col = c("black","red","blue"), lty=1)

## Names of tick marks to be changed to abbreviated days of the week
sub_data$Date  <- dmy(sub_data$Date)
sub_data$Date  <- as.POSIXct(sub_data$Date, format = "%Y-%m-%d")
seq_dates <- seq(from = min(sub_data$Date), to = max(sub_data$Date),by = "day")
axis(1, at = seq_dates, labels = format(seq_dates,"%a"))

dev.off()