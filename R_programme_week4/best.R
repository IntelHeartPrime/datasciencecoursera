best <- function(state, outcome) {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  
  ##"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack" ,11
  ##"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure" ,17
  ##"Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"  ,23
  
  ## xx<-outcome[which(outcome$State=="AL"),]    use which function get the rows
  
  ##define a function of get a atomic from a Vector.  alphbetical order
  outcome1<-read.csv("outcome-of-care-measures.csv")
  #get the state
  state_Vector<-as.vector(outcome1[which(outcome1$State==state),])
  ## the which return a factor  then change it to Vector
  
  if("try-error" %in% class(state_Vector))
  {
    print("Error in best")
    return 
  }
  print("easy")
  ##get the outcome1
  if(outcome=="heart attack"){
    #return the state_Vector[,2] with the min number of coulumn 11;
    min_Vector<-as.vector(state_Vector[,11])
    print("easy2")
    index<-as.vector((which(min_Vector==min(min_Vector),arr.ind=TRUE)))
    print("easy3")
    print(index)
    result<-state_Vector[index,2]
    return (as.ordered(result)[1])
  }
  if(outcome=="heart failure"){
    #return the state_Vector[,2] with the min number of coulumn 17;
    min_Vector<-as.vector(state_Vector[,17])
    index<-as.vector((which(min_Vector==min(min_Vector),arr.ind=TRUE)))
    result<-state_Vector[index,2]
    return (as.ordered(result)[1])
  }
  if(outcome=="pneumonia"){
    #return the state_Vector[,2] with the min number of coulumn 23;
    min_Vector<-as.vector(state_Vector[,23])
    index<-as.vector((which(min_Vector==min(min_Vector),arr.ind=TRUE)))
    result<-state_Vector[index,2]
    return (as.ordered(result)[1])
  }
  
}
