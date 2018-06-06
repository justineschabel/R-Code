#Q implemented in R
#Take in a vector and a value
insert <- function(vector, value){
  #append the value to the end of the vector and return it 
  newvector <- append(vector, value)
  return(newvector)
}

# Start with a vecor
vec <- c(2,3,4)
#append a value to the end 
queue <- insert(vec, 1)
cat("after inserting 1: ", queue)

#remove a value from a queue, return the value and the remaining queue
remove <- function(vec){
  #Get the first value in the queue
  val <- vec[1]
  #get the remaining of the queue
  vec2 <- vec[2:length(vec)]
  #return both the returned value and the queue in a vector
  ret <- c(val, vec2)
  return(ret)
}

#remove a value and return the value and the altered queue
empty <- c(1,2,3)
alteredvector <- remove(empty)
removed <- alteredvector[1]
if(is.na(alteredvector[2])){
  #queue <- vector(mode="numeric", length=0)
  #print(queue)
  print("Empty")
} else{
  queue <- alteredvector[2:length(alteredvector)]
  print(queue)s
}



cat("removed value: ", removed," remaining queue: ", queue)

