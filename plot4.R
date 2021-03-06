plot4<-function(){
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
    
    ## Save par() settings
    OldPar<-par(no.readonly = TRUE)
    ## Drawing a plot
    png("plot4.png", width = 480, height = 480)
    par(mfrow=c(2,2))
    {
        with(DataToDraw, plot(DataToDraw$DateTime,DataToDraw$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
        ##
        with(DataToDraw, plot(DataToDraw$DateTime,DataToDraw$Voltage,type="l",xlab="datetime",ylab="Voltage"))
        ##
        with(DataToDraw, plot(DataToDraw$DateTime,DataToDraw$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",col="black"))
        with(DataToDraw, points(DataToDraw$DateTime,DataToDraw$Sub_metering_2,col="red",type="l"))
        with(DataToDraw, points(DataToDraw$DateTime,DataToDraw$Sub_metering_3,col="blue",type="l"))
        with(DataToDraw, legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1,col = c("black","red","blue")))
        ##
        with(DataToDraw, plot(DataToDraw$DateTime,DataToDraw$Global_reactive_power,type="l",xlab="datetime", ylab="Global_reactive_power"))
    }
    dev.off()
    ## Restore par() settings
    par(OldPar)
}