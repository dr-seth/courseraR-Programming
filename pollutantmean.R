pollutantmean<-function(directory,pollutant,id=1:332){
  directory<-"~/R-wd/specdata"                              #specify working directory
  setwd(directory)                                          #set working directory
  fl<-dir()                                                 #specify files
  da<-data.frame()                                          #specify data as dataframe
  for(i in id)                                              #read thru all data files
  {
    da<-rbind(da,read.csv(fl[i]))                           #read specified files
  }
  mean<-round(mean(da[,pollutant],na.rm=TRUE), digits = 3)  #calculate mean and round to 3 decimals
  mean                                                      #print the mean
}
