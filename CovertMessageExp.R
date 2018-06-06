#We want to send a secret message through a packet channel by modifying the interpacket delays to encode 0s and 1s. 
#We want to buffer packets coming in so we can control the delays and send the message
#But the buffer has a limited capacity and we cant send our message if we overflow or underflow
#Here we generate the interpacket delays using the exponential distribution 

overflow = 0
underflow = 0
size <- c(16,32)
start <- c(2, 6, 10, 14, 18)
maxsize = 20
currentsize = 0
time = 0
numtrials = 1000
probsO <- c(numtrials)
probsU <- c(numtrials)


  for(m in 1:length(size)){
    for(i in 1:length(start)){
      for(z in 1:numtrials){
      message <- sample(0:1, size[m]+1, replace= TRUE)
      ipdExp <- rexp(3*size[m])
      
      minExp <- min(ipdExp)
      medExp <- median(ipdExp)
      maxExp <- max(ipdExp)
      
      
      cumulitiveipdExp <- c(ipdExp)
      for(j in 2:length(cumulitiveipdExp)){
        cumulitiveipdExp[j] = cumulitiveipdExp[j]+ cumulitiveipdExp[j-1]
      }
      

      modifiedExp <- c(cumulitiveipdExp)
      
      add <- 0
      x = start[i] 
      for( k in (x+1):(size[m] + x)){
        if(message[k-x+1] == 0){
          add <- runif(1, minExp, medExp)
          modifiedExp[k] = add + modifiedExp[k-1]
        }
        if(message[k-x+1] == 1){
          add <- sample(medExp:maxExp,1)
          modifiedExp[k] = add + modifiedExp[k-1]
        }
      }
  
      for(l in 17:32){
        modifiedExp[l] = ipdExp[l] + modifiedExp[l-1]
      }
      
      overtE <- c(cumulitiveipdExp[x:length(cumulitiveipdExp)])
      covertE <- c(modifiedExp[x:length(modifiedExp)])
      
      buffer <- c(overtE[1:start[i]])
      indexOvert <- 0
      indexCovert <- 0
      #while(!(length(overtE) == 0 | length(covertE) == 0)){
      while(!(is.na(overtE) | is.na(covertE))){
        if(length(buffer) == 20){
          #print("Overflow")
          overflow = overflow + 1
          break;
        }
        if(is.na(buffer[1])){
          #print("Underflow")
          underflow = underflow + 1
          break;
        }
       if(overtE[1] < covertE[1]){
        buffer <- append(buffer, overtE[1])
        overtE <- overtE[2:length(overtE)]
       } else{
         buffer <- buffer[2:length(buffer)]
         covertE <- covertE[2:length(covertE)]
       }
      }
      probsO[z] = (overflow/numtrials)
      probsU[z] = (underflow/numtrials)
      }
      overflow = 0
      underflow = 0
      cat("Overflow ",mean(probsO), " Underflow ", mean(probsU), start[i], " Win ", 1 -mean(probsO) - mean(probsU) , "\n")
  }
  }

