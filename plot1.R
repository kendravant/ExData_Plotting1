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


#Create the plot and send it to a png file
png(file = "ExData_Plotting1/plot1.png")

  par(mfrow = c(1,1))
  with (df, hist(Global_active_power,
                 breaks=20, 
                 col="red", 
                 main = "Global Active Power",
                 xlab = "Global Active Power (kilowatts)")
  )

dev.off()