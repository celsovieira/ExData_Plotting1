df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

df1 <- subset(df, df[,1] == "1/2/2007" | df[,1] == "2/2/2007")

png(file = "plot1.png", width = 480, height = 480, units = "px")

hist(df1$Global_active_power, col = "red", ylim = c(0, 1200), 
     xlab = "Global Active Power(Kilowatts)", main = "Global Active Power")

dev.off()