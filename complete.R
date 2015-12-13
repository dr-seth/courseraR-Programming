complete<-function(directory,id=1:332){
  directory<-"~/R-wd/specdata"            #define directory path
  setwd(directory)                        #set working directoru
  files<-dir()                            #specify files
  a<-data.frame()                         #define as data frame
  for(i in id)                            #read thru all data files
  {
    b<-read.csv(files[i])
    c<-complete.cases(b)
    d<-b[c,]
    x<-c(i,nrow(d))
    a<-rbind(a,x)
  }
  names(a)<-c("id","nobs")
  a
}
