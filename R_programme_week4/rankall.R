rankall <- function(outcome, num = "best") { ## Read outcome data
  ## Check that state and outcome are valid
  ## For each state, find the hospital of the given rank
  ## Return a data frame with the hospital names and the ## (abbreviated) state name
  
  ##get the enum of State Vector of State
  ##use the lapply 
  ##the function  rankhospital.function
  ##get the index in the origin DataFrame
  #library
  source('~/datasciencecoursera/R_programme_week4/rankhospital.R')
  outcome1<-read.csv("outcome-of-care-measures.csv")
  #get the state
  enum_index<-duplicated(as.vector(outcome1[,7]))
  enum<-as.array(outcome1[,7])[!enum_index]
  enum<-as.matrix(enum)
  #use the lapply of the function of rankhospital.R
  result<-apply(enum,1,rankhospital,outcome,num)
  ##print(result)
  output<-cbind(as.vector(enum),as.character(result))
  ##print(output)
  ##also
  ## result<-apply(enum,2,rankhospital,outcome,num)
}

