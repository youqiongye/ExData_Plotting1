##plot2, Global_active_power change during the time
#Date: Date in format dd/mm/yyyy
#Time: time in format hh:mm:ss
#Global_active_power: household global minute-averaged active power (in kilowatt)
#check if exit the data in R workspace
if(!exists("hpc.data")) {
  source('getdata.R')
  getdata()
}
# creat a function which plot the picture
plot2<-function(){
  #The datetime data
  hpc.data_sub$DateTime <- strptime(paste(hpc.data_sub$Date, hpc.data_sub$Time), format="%d/%m/%Y %H:%M:%S")
  # change into numeric, and create vector
  DateTime<-as.numeric(hpc.data_sub$DateTime)
  # creat the vector of Global_active_power
  gap<-hpc.data_sub$Global_active_power
  # plot the picture, and don't include the axis label
  plot(DateTime,gap,type="l", xaxt="n",yaxt="n",xlab="",ylab = "Global Active Power (Kilowatts)")
  # add x axis label, and change the numeric type time into week pattern
  axis(1, at=c(min(DateTime), min(DateTime)+86400,  min(DateTime)+2*86400),
       labels=c("Thu", "Fri", "Sat"))  
  # add y axis which Kilowatts unit
  axis(2,at=c(0,1000,2000,3000),labels=c(0,2,4,6))
}
png(filename="plot3.png",width = 480, height = 480, units = "px",bg="white")#PNG file device
plot2() # call the plot2() function
dev.off()