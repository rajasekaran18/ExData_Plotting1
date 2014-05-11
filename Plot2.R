
plot2 <- function(){
  
  electricData <- as.data.frame(read.table("./exdata-data-household_power_consumption/household_power_consumption.txt", sep = ";", header=TRUE, as.is = TRUE, na.strings = "?"))
  
  
  electricDatawithDateRange <- subset(electricData, (strptime(electricData$Date, "%d/%m/%Y") > as.POSIXlt(as.Date("2007-02-01")) & 
                                                       strptime(electricData$Date, "%d/%m/%Y") < as.POSIXlt(as.Date("2007-02-03")) ) )
  
  electricDatawithDateRange$datetime  <- strptime(paste(electricDatawithDateRange$Date, electricDatawithDateRange$Time), "%d/%m/%Y %H:%M:%S")
  
  with(electricDatawithDateRange, plot(datetime,as.numeric(Global_active_power), type = "l", , xlab="", ylab="Global Active Power (kilowatts)" ))
  
  dev.copy(png, file = "Plot2.png", width = 480, height = 480)
  dev.off()     
  
  
}