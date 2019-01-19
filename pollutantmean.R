pollutantmean<- function(directory,pollutant,id=1:332){
  library(stringr)
  result<-c()
  getStr_3<- function(id){
    if(id<10){
      res<-str_c("00",id)
    }
    if(id>=10 && id<100){
      res<-str_c("0",id)
    }
    if(id>=100){
      res<-id
    }
    res
  }
  
  getSingle_mean<- function(id){
    fileV<-read.csv(str_c(directory,"/",getStr_3(id),".csv"))
    single_mean<-mean(fileV[[pollutant]],na.rm = TRUE)
  }
  
  #总执行脚本
  for(x in id){
    result<-c(result,getSingle_mean(x))
  }
  print(result)
  result_mean<-mean(result)
  result_mean
}