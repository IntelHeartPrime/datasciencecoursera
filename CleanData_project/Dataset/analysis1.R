run_analysis<-function(){
  setwd("~/datasciencecoursera/CleanData_project/Dataset")
  
  #load the features.txt and use grep to distract the index of mean and divation
  features<-read.table("features.txt")
  features_v2<-features$V2
  mean_std_index<-grep("mean[()]|std[()]",features_v2,value = F)
  
  #test
  test_subject<-read.table("test/subject_test.txt")
  test_x<-read.table("test/X_test.txt")
  test_y<-read.table("test/Y_test.txt")
  
  test_x_mean_std<-test_x[,mean_std_index]
  
  #train
  train_subject<-read.table("train/subject_train.txt")
  train_x<-read.table("train/X_train.txt")
  train_y<-read.table("train/Y_train.txt")
  
  train_x_mean_std<-train_x[,mean_std_index]
  
  #get a new dataset of testData subject_id,mean,std....66... activity,train/test
  #get a new dataset of trainData subject_id,mean,std....66... activity,train/test
  #merge it
  
}

