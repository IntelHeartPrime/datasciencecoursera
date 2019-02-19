corr<- function(directory,threshold = 0){
  library(stringr)
  resultOutput<-c()
  ids<-1:332
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
  
  getSingle_coor<- function(id){
    fileV<-read.csv(str_c(directory,"/",getStr_3(id),".csv"))
    sulfate<-fileV[["sulfate"]]
    nitrate<-fileV[["nitrate"]]
    
    sulfateBool<-is.na(sulfate)
    nitrateBool<-is.na(nitrate)
    
    index<-sulfateBool|nitrateBool
    
    sulfate_Caculate<-sulfate[!index]
    nitrate_Caculate<-nitrate[!index]
    
    result<-cor(sulfate_Caculate,nitrate_Caculate)
    length<-length(sulfate_Caculate)
    out<-c(result,length)
    out
  }
  
  
  for(x in ids){
    out<-getSingle_coor(x)
    if(out[2]>threshold){
      resultOutput<-c(resultOutput,out[1])
    }
  }
  resultOutput

}