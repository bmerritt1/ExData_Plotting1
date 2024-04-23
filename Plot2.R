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

## plot a line graph -- combined Date/Time with Global_active_power 
png(filename = "plot2.png")
plot(sub_data$Global_active_power ~ sub_data$plot_col, type = "l",xaxt = "n",
     xlab = "", ylab = "Global Active Power (kilowatts)")

## Names of tick marks to be changed to abbreviated days of the week
sub_data$Date  <- dmy(sub_data$Date)
sub_data$Date  <- as.POSIXct(sub_data$Date, format = "%Y-%m-%d")
seq_dates <- seq(from = min(sub_data$Date), to = max(sub_data$Date),by = "day")
axis(1, at = seq_dates, labels = format(seq_dates,"%a"))

dev.off()
