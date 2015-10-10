
df <- read.table("household_power_consumption.txt", 
                 header = TRUE, sep = ";", na.strings = "?")
df1 <- subset(df, df[,1] == "2/2/2007" | df[,1] == "1/2/2007")
df1 <- df1[complete.cases(df1),]


df1[,1] <- as.Date(df1[,1],format='%d/%m/%Y')
datetime <- strptime(paste(df1[,1], df1[,2]),format='%Y-%m-%d %H:%M:%S')


with(df1, plot(datetime, Global_active_power, 
                xlab = "", ylab = "Global Active Power (kilowatts)", type = 'l'))

dev.copy(png, file = "plot2.png", width = 480, height = 480, units = "px")
dev.off()