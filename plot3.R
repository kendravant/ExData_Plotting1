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
png(file = "ExData_Plotting1/plot3.png")

  par(mfrow = c(1,1))
  with(df, plot(DateTime, Sub_metering_1,type="n",
                xlab="", 
                ylab = "Energy sub metering"))
  with(df, lines(DateTime, Sub_metering_1,col="black"))
  with(df, lines(DateTime, Sub_metering_2,col="red"))
  with(df, lines(DateTime, Sub_metering_3,col="blue"))
  legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
