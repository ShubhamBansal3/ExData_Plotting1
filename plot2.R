PowerConsumption<-  read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors =  F)

PowerConsumption$Date<- as.Date(PowerConsumption$Date, "%d/%m/%Y")

PowerConsumptiontbl<- tbl_df(PowerConsumption)

PowerConsumptiontbl<- filter(PowerConsumptiontbl, Date=="2007-02-01" | Date=="2007-02-02")

PowerConsumptiontbl$Global_active_power<- as.numeric(PowerConsumptiontbl$Global_active_power)

DateTime<-  strptime(paste(as.character(PowerConsumptiontbl$Date),PowerConsumptiontbl$Time),"%Y-%m-%d %H:%M:%S")

png(filename = "plot2.png", width = 480, height = 480)

plot( DateTime,PowerConsumptiontbl$Global_active_power, type = "l", xlab = "",ylab = "Global Active Power (kilowatts)")

dev.off()
