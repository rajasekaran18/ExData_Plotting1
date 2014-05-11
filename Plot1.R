
plot1 <- function(){
  
  electricData <- read.table("./exdata-data-household_power_consumption/household_power_consumption.txt", sep = ";", stringsAsFactors=FALSE, header=TRUE, na.strings = "?")
  
    
  electricDatawithDateRange <- subset(electricData, (strptime(electricData$Date, "%d/%m/%Y") > as.POSIXlt(as.Date("2007-02-01")) & 
                                                       strptime(electricData$Date, "%d/%m/%Y") < as.POSIXlt(as.Date("2007-02-03")) ) )
  
  #print(nrow(electricDatawithDateRange))
  
  hist(as.numeric(electricDatawithDateRange$Global_active_power), col = "red", main="Global Active Power", 
       xlab="Global active Power (kilowatts)", ylab = "Frequency")
 
  dev.copy(png, file = "Plot1.png", width = 480, height = 480)
  dev.off()     
        
  
}