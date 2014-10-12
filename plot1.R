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

#Plot histogram
hist(Data$Global_active_power,
     col="Red",
     main="Global Active Power",
     ylab="Frequency",
     xlab="Global Active Power (kilowatts)",
     axes = TRUE)

#print histogram
dev.print(device=png, file="./Project/plot1.png", height=480, width=480)
dev.off()