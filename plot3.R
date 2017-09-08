PowerConsumption<-  read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors =  F)

PowerConsumption$Date<- as.Date(PowerConsumption$Date, "%d/%m/%Y")

PowerConsumptiontbl<- tbl_df(PowerConsumption)

PowerConsumptiontbl<- filter(PowerConsumptiontbl, Date=="2007-02-01" | Date=="2007-02-02")

PowerConsumptiontbl$Global_active_power<- as.numeric(PowerConsumptiontbl$Global_active_power)

DateTime<-  strptime(paste(as.character(PowerConsumptiontbl$Date),PowerConsumptiontbl$Time),"%Y-%m-%d %H:%M:%S")

subMetering1 <- as.numeric(PowerConsumptiontbl$Sub_metering_1)
subMetering2 <- as.numeric(PowerConsumptiontbl$Sub_metering_2)
subMetering3 <- as.numeric(PowerConsumptiontbl$Sub_metering_3)

png(filename = "plot3.png", width = 480, height = 480)

plot(DateTime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(DateTime, subMetering2, type="l", col="red")
lines(DateTime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()