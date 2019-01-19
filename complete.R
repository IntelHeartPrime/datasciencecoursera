complete<- function(directory,id=1:332){
   library(stringr)
   ids<-c()
   nobs<-c()
   
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
   
   getSingle_nobs<- function(id){
     fileV<-read.csv(str_c(directory,"/",getStr_3(id),".csv"))
     sulfate<-fileV[["sulfate"]]
     nitrate<-fileV[["nitrate"]]
     sulfateBool<-is.na(sulfate)
     nitrateBool<-is.na(nitrate)
     result<-sulfateBool|nitrateBool
     result1<-sulfate[!result]
     output<-c(id,length(result1))
     output
   }
   
   for(x in id){
     output<-getSingle_nobs(x)
     ids<-c(ids,output[1])
     nobs<-c(nobs,output[2])
   }
   resultOutput<-cbind(ids,nobs)
   rownames(resultOutput)<-1:length(ids)
   ##colnames(resultOutput)<-c("id","nobs")
   resultOutput
}