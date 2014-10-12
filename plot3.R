#read Dataset
Data <- read.csv("./Project/household_power_consumption.txt", 
                 header=TRUE, 
                 sep=";",
                 dec=".",
                 na.strings="?", 
                 nrows=2075259, 
                 stringsAsFactors=FALSE)

#Shaping and Formatting dates
Data$Date <- as.Date(Data$Date, format="%d/%m/%Y")
Data <- Data[Data$Date == "2007-02-01" | Data$Date == "2007-02-02",]

#Creating a new Time column as suggested by ExData_Plotting1 repo
Data$OkTime <- strptime(paste(Data$Date, Data$Time), "%Y-%m-%d %H:%M:%S")

#Call device driver 
png(file="./Project/plot3.png",width=480,height=480)

#Plot
plot(Data$OkTime, Data$Sub_metering_1, 
     type = "l",
     col = "black",
     xlab = "", ylab = "Energy sub metering")
lines(Data$OkTime, Data$Sub_metering_2, col = "red")
lines(Data$OkTime, Data$Sub_metering_3, col = "blue")
legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       merge = TRUE,
       lty = 1,
       lwd = 1)

#shut down device driver.
dev.off()