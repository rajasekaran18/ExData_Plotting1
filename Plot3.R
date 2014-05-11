
plot3 <- function(){
  
  electricData <- as.data.frame(read.table("./exdata-data-household_power_consumption/household_power_consumption.txt", sep = ";", header=TRUE, as.is = TRUE, na.strings = "?"))
  
 
  electricDatawithDateRange <- subset(electricData, (strptime(electricData$Date, "%d/%m/%Y") > as.POSIXlt(as.Date("2007-02-01")) & 
                                                       strptime(electricData$Date, "%d/%m/%Y") < as.POSIXlt(as.Date("2007-02-03")) ) )
    
  electricDatawithDateRange$datetime  <- strptime(paste(electricDatawithDateRange$Date, electricDatawithDateRange$Time), "%d/%m/%Y %H:%M:%S")
  
  #par(mfrow = c(1,1))

  yrange<-range(c(electricDatawithDateRange$Sub_metering_1,electricDatawithDateRange$Sub_metering_2,electricDatawithDateRange$Sub_metering_3))
  
 plot(electricDatawithDateRange$datetime,as.numeric(electricDatawithDateRange$Sub_metering_1), type = "l", xlab="", ylab="Energy sub metering",  ylim = yrange, col= "black")
 par (new = TRUE)
 
 plot(electricDatawithDateRange$datetime,as.numeric(electricDatawithDateRange$Sub_metering_2), type = "l", xlab="", ylab="", ylim = yrange, col = "red") 
 par (new = TRUE)
 
 plot(electricDatawithDateRange$datetime,as.numeric(electricDatawithDateRange$Sub_metering_3), type = "l", xlab="", ylab="", ylim = yrange, col = "blue") 
 
   
  legend("topright",cex=0.7, lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  dev.copy(png, file = "Plot3.png", width = 480, height = 480)
  dev.off()     
  
  
}