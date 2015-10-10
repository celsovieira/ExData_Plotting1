
df <- read.table("household_power_consumption.txt", 
                 header = TRUE, sep = ";", na.strings = "?")
df1 <- subset(df, df[,1] == "2/2/2007" | df[,1] == "1/2/2007")
df1 <- df1[complete.cases(df1),]


df1[,1] <- as.Date(df1[,1],format='%d/%m/%Y')
datetime <- strptime(paste(df1[,1], df1[,2]),format='%Y-%m-%d %H:%M:%S')

png("plot3.png", width = 480, height = 480, units = "px")

plot(datetime, df1$Sub_metering_1, 
               xlab = "", ylab = "Energy Sub Metering", type = 'l')
     lines(datetime, df1$Sub_metering_2, col = "red")
     lines(datetime, df1$Sub_metering_3, col = "blue")
     legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
            lty = 1, lwd = 2, col = c("black", "red", "blue"), xjust = 0)
     
dev.off()