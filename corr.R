corr<-function(directory,threshold=0){
  directory<-"~/R-wd/specdata"            #define directory path
  setwd(directory)
  files<-dir()
  correlation<-vector("numeric")
  id=1:332
  for(i in id)
  {
    a<-read.csv(files[i])
    b<-complete.cases(a)
    c<-a[b,]
    if(nrow(c)>threshold){
      x<-c[,2]
      y<-c[,3]
      correlation<-append(correlation,cor(x,y))     
    }
  }
  correlation
}
