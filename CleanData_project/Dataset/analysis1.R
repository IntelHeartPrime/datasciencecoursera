run_analysis<-function(){
  setwd("~/datasciencecoursera/CleanData_project/Dataset")
  
  #the first part
  
  #load the features.txt and use grep to distract the index of mean and divation
  features<-read.table("features.txt")
  features_v2<-features$V2
  mean_std_index<-grep("mean[()]|std[()]",features_v2,value = F)
  mean_std_info<-grep("mean[()]|std[()]",features_v2,value = T)
  
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
  
  #create the rowNames
  Data_column_names<-c("subject_type","subject_id","activity_type",mean_std_info)
  
  #get a new dataset of testData subject_id,mean,std....66... activity,train/test
  
  #create a Vector of subject_type
  subject_type1<-rep("test",length(test_subject))
  DataFrame_test<-data.frame(subject_type1,test_subject,test_y,test_x_mean_std)
  colnames(DataFrame_test)<-Data_column_names
  
  #get a new dataset of trainData subject_id,mean,std....66... activity,train/test
  subject_type2<-rep("train",length(train_subject))
  DataFrame_train<-data.frame(subject_type2,train_subject,train_y,train_x_mean_std)
  colnames(DataFrame_train)<-Data_column_names
  
  #merge it
  Data_all_subject<-rbind(DataFrame_test,DataFrame_train)
  
  #write it into a txt file
  write.table(Data_all_subject,"dataset1.txt",row.names = FALSE)
  
  
  #the second part
  Data_part2_columns_names<-c("subject_type","activity_id",mean_std_info)
  
  #test
  matrix_test<-matrix(nrow=1,ncol = 66)
  activity_column<-seq(1,by=1,length.out = 6)
  for (activity_id in activity_column){
    activity_rows<-DataFrame_test[which(DataFrame_test$activity_type==activity_id),]
    columns_average<-c()
    for (column_id in seq(4,by=1,length.out = 66)){
      columns_average<-c(columns_average,mean(activity_rows[,column_id]))
    }
    matrix_test<-rbind(matrix_test,columns_average)
  }
  #delete the first row of matrix_test
  matrix_test<-matrix_test[-1,]
  activity_column<-c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
  subject_column<-rep("test",6)
  DataFrame_average_test<-data.frame(subject_column,activity_column,matrix_test)
  colnames(DataFrame_average_test)<-Data_part2_columns_names
  
  #train
  matrix_train<-matrix(nrow=1,ncol = 66)
  activity_column<-seq(1,by=1,length.out = 6)
  for (activity_id in activity_column){
    activity_rows<-DataFrame_train[which(DataFrame_train$activity_type==activity_id),]
    columns_average<-c()
    for (column_id in seq(4,by=1,length.out = 66)){
      columns_average<-c(columns_average,mean(activity_rows[,column_id]))
    }
    matrix_train<-rbind(matrix_train,columns_average)
  }
  #delete the first row of matrix_train
  matrix_train<-matrix_train[-1,]
  activity_column<-c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
  subject_column<-rep("train",6)
  DataFrame_average_train<-data.frame(subject_column,activity_column,matrix_train)
  colnames(DataFrame_average_train)<-Data_part2_columns_names
  
  #merge it
  DataFrame_average<-rbind(DataFrame_average_test,DataFrame_average_train)
  #write it into a txt file
  write.table(DataFrame_average,"dataset2.txt",row.names = FALSE)
}

