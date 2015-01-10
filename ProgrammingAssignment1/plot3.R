##plot3, three conditons of energy sub-metering change during the time
#Date: Date in format dd/mm/yyyy
#Time: time in format hh:mm:ss
#Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
#Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
#Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.
#check if exit the data in R workspace
if(!exists("hpc.data")) {
  source('getdata.R')
  getdata()
}
plot3<-function(){
  DateTime<-as.numeric(hpc.data_sub$DateTime)
  # creat the numeric vector of sub metering
  Sub_metering_1<-as.numeric(as.character(hpc.data_sub$Sub_metering_1))
  Sub_metering_2<-as.numeric(as.character(hpc.data_sub$Sub_metering_2))
  Sub_metering_3<-as.numeric(as.character(hpc.data_sub$Sub_metering_3))
  # set the y value range
  yrange<-range(c(Sub_metering_1,Sub_metering_2,Sub_metering_3))
  # plot the picture, and don't include the axis label
  plot(DateTime,Sub_metering_1,type="l", xaxt="n",ylim=yrange,yaxt="n",xlab="",col="black")
  lines(DateTime,Sub_metering_2, type="l",col="red",ylim=yrange) # add the data on the same plot
  lines(DateTime,Sub_metering_3, col="blue",ylim=yrange)
  # add x axis label, and change the numeric type time into week pattern
  axis(1, at=c(min(DateTime), min(DateTime)+86400,  min(DateTime)+2*86400),
       labels=c("Thu", "Fri", "Sat"))
  # add y axis which sub metering value
  axis(2,at=c(0,10,20,30),labels=c(0,10,20,30))
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         lty=c(1,1), lwd=c(2.5,2.5), col=c("black","red","blue"))
}
png(filename="plot3.png",width = 480, height = 480, units = "px",bg="white")#PNG file device
plot3() # call the plot3() function
dev.off() # close file device