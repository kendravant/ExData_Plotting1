# Define the column types and read in the data
columnTypes <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
df_full <- read.table("household_power_consumption.txt", 
                      sep=";", 
                      nrows = 2075265, 
                      header=TRUE, 
                      colClasses = columnTypes,
                      na.strings = "?")

# Subset to keep just the dates we want
df <- subset(df_full, Date %in% c("1/2/2007","2/2/2007"))
df$DateTime <- paste(df$Date,df$Time)
df$DateTime <- strptime(df$DateTime,"%d/%m/%Y %T")


# Create the plot and send it to a png file
png(file = "ExData_Plotting1/plot4.png")

  par(mfrow = c(2,2))
  
  # Top left
  with(df, plot(DateTime, Global_active_power,type="n",
                xlab="", 
                ylab = "Global Active Power"))
  with(df, lines(DateTime, Global_active_power))
  
  
  # Top right
  with(df, plot(DateTime, Voltage, type="n",
                xlab="datetime", 
                ylab = "Voltage"))
  with(df, lines(DateTime, Voltage))
  
  # Bottom left
  with(df, plot(DateTime, Sub_metering_1,type="n",
                xlab="", 
                ylab = "Energy sub metering"))
  with(df, lines(DateTime, Sub_metering_1,col="black"))
  with(df, lines(DateTime, Sub_metering_2,col="red"))
  with(df, lines(DateTime, Sub_metering_3,col="blue"))
  legend("topright", lty = 1, bty = "n", cex = 0.9, 
         col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  # Bottom right
  with(df, plot(DateTime, Global_reactive_power,type="n",
                xlab="datetime", 
                ylab = "Global_reactive_power"))
  with(df, lines(DateTime, Global_reactive_power))

dev.off()
