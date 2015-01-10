#download the file from website
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","household_power_consumption.zip")
#unzip the zip file and load the data by read.table
hpc.data<-read.table(unz("household_power_consumption.zip","household_power_consumption.txt"),
                     header=TRUE,sep=";")

#set the subset of the data which only use data from the dates 2007-02-01 and 2007-02-02
hpc.data_sub<-subset(hpc.data, as.Date(hpc.data$Date, format="%d/%m/%Y") %in% as.Date(c("2007-02-01", "2007-02-02"), format="%Y-%m-%d"))
