#Start with i, current is how much i have in the current round 
startvalues <- c(2, 6, 10, 14, 18)
for(val in startvalues){
  start <- val
  current <- start
  
  #Each round I can win or lose
  round <- c(-1,1) 
  
  #keep track of the number of times we win or lose a round 
  win <- 0
  lose <- 0
  
  overflow <- 20
  underflow <- 0 
  
  #Number of rounds
  numrounds <- 2000
  for(i in 1:numrounds){
    
    # Continue the game until i win or lose 
    while(!(current == underflow | current == overflow)){
      value <- sample(round, 1, replace = TRUE)
      current <- current + value
    }
    
    if (current == 20){
      win <- win + 1
      current <- start
    }
    if (current == 0){
      lose <- lose + 1
      current <- start
    }
  }
  probabilityW <- win/numrounds
  probabilityL <- lose/numrounds
  cat("With value", val, ": P(W) ", probabilityW, " P(L): ", probabilityL, "\n")
}


