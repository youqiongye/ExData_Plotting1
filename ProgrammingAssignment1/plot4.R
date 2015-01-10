##plot4,combine plot2() and plot3(), and the voltage and Global reactive power during the time 
#Date: Date in format dd/mm/yyyy
#Time: time in format hh:mm:ss
#Global_active_power: household global minute-averaged active power (in kilowatt)
#Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
#Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
#Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.
#Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
#Voltage: minute-averaged voltage (in volt)

#check if exit the data in R workspace
if(!exists("hpc.data")) {
  source('getdata.R')
  getdata()
}

source("plot2.R")
source("plot3.R")

plot4<-function(){
  par(mfrow=c(2,2))
  plot2() # reuse the plot2
  # create the second plot of plot4
  plot4.2<-function(){
    #DateTime<-as.numeric(hpc.data_sub$DateTime)
    Voltage<-as.numeric(as.character(hpc.data_sub$Voltage))
    plot(DateTime,Voltage,type="l", xaxt="n",yaxt="n",col="black")
    # add x axis label, and change the numeric type time into week pattern
    axis(1, at=c(min(DateTime), min(DateTime)+86400,  min(DateTime)+2*86400),
         labels=c("Thu", "Fri", "Sat"))
    # add y axis which voltage value
    axis(2,at=c(234,238,242,246),labels=c(234,238,242,246))
  }
  plot4.2()
  plot3()
  plot4.4<-function(){
    DateTime<-as.numeric(hpc.data_sub$DateTime)
    # add y axis which global reactive power value
    grp<-as.numeric(as.character(hpc.data_sub$Global_reactive_power))
    plot(DateTime,grp,type="l",ylab="Global_reactive_power", xaxt="n",col="black")
  } 
  plot4.4()
  
}
png(filename="plot4.png",width = 480, height = 480, units = "px",bg="white")#PNG file device
plot4() # call the plot4() function
dev.off() # close file device