#The famous Monty Gameshow 
#Find the probability of winning if the contestant switches doors 
#Number of times contestent switches 
n.switch <- 0
#Number of times the experiment is run per trial
trials <- 100

#number of trials
num <- 1000

#To keep track of the probability every trial
probs <- numeric(num)

for(i in 1:num){
  for(k in 1:trials){
    n.cardoor <- sample(1:3,1) #choose a door for the car to be behind
    n.guess <- sample(1.3,1) #contestant's guess
    if(n.cardoor != n.guess){
      n.switch <- n.switch + 1 # automatic success, because contestant switches
    }
  }
  probs[i] <- n.switch/i # number of times the contestant rightfully switched/num experiments
} 
plot(1:num,probs)