
###plot the first picture, the histogram of Global Active Power frequency count
if(!exists("hpc.data")) {
  source('getdata.R')
  getdata()
}
png(filename="plot1.png",width = 480, height = 480, units = "px",bg="white")#PNG file device

hist(as.numeric(hpc.data_sub$Global_active_power),freq=T,col="red",
     main = "Global Active Power", xlab = "Global Active Power (Kilowatts)", breaks = 20)
dev.off() #Close the PNG file divice
