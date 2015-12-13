pollutantmean<-function(directory,pollutant,id=1:332){
  directory<-"~/R-wd/specdata"
  setwd(directory)   
  files<-dir()
  data<-data.frame()
  for(i in id)
  {
    data<-rbind(data,read.csv(files[i]))
  }
  mean<-round(mean(data[,pollutant],na.rm=TRUE), digits = 3)
  setwd("~/R-wd/specdata")
  mean
}
