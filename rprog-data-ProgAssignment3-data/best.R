
# Finding the best hospital in a state ------------------------------------

best <- function(state, outcome) {
  ## Read outcome data
  dt <- read.csv("outcome-of-care-measures.csv")
  
  ## Check that state and outcome are valid
  if (!state %in% levels(dt$State))
  stop("invalid state")
  else if (!outcome %in% c('heart attack','heart failure', 'pneumonia'))
  stop("invalid outcome")
  
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  else
    subdata <- dt[,c(2,7,11,17,23)]
    names(subdata)[3:5] <- c('heart attack','heart failure', 'pneumonia')
    inState <- subdata[subdata$State==state,]
    inState[,outcome] <- as.numeric(inState[,outcome])
    best.hos <- inState[order(inState[,outcome], inState[,1]),]
    return(best.hos[1,1])
}
best("TX", "heart attack")
best("TX", "heart failure")
best("MD", "heart attack")
best("MD", "pneumonia")
