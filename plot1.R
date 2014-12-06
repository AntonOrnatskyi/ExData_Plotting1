plot1<-function(){
    ## Reading, subsetting and converting data
    PowerC<-read.csv2("household_power_consumption.txt", stringsAsFactors=FALSE, na.strings = "?")
    PowerC$Global_active_power<-as.numeric(PowerC$Global_active_power)
    PowerC$Global_reactive_power<-as.numeric(PowerC$Global_reactive_power)
    PowerC$Voltage<-as.numeric(PowerC$Voltage)
    PowerC$Global_intensity<-as.numeric(PowerC$Global_intensity)
    PowerC$Sub_metering_1<-as.numeric(PowerC$Sub_metering_1)
    PowerC$Sub_metering_2<-as.numeric(PowerC$Sub_metering_2)
    PowerC$Sub_metering_3<-as.numeric(PowerC$Sub_metering_3)
    DataToDraw<-subset(PowerC,Date=="2/2/2007" | Date=="1/2/2007")
    rm(PowerC)
    DataToDraw$DateTime<-paste(DataToDraw$Date,DataToDraw$Time)
    DataToDraw$DateTime<-strptime(DataToDraw$DateTime,"%d/%m/%Y %H:%M:%S")

    ## Drawing a plot
    png("plot1.png", width = 480, height = 480)
    hist(DataToDraw$Global_active_power, col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
    dev.off()
}