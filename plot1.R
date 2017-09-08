PowerConsumption<-  read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors =  F)

PowerConsumption$Date<- as.Date(PowerConsumption$Date, "%d/%m/%Y")

PowerConsumptiontbl<- tbl_df(PowerConsumption)

PowerConsumptiontbl<- filter(PowerConsumptiontbl, Date=="2007-02-01" | Date=="2007-02-02")

PowerConsumptiontbl$Global_active_power<- as.numeric(PowerConsumptiontbl$Global_active_power)

png(filename = "plot1.png", width = 480, height = 480)

hist(PowerConsumptiontbl$Global_active_power, col="red", main ="Global Active Power", xlab = "Global Active Power(killowats)")

dev.off()