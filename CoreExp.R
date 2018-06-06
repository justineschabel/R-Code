#Two core in a CPU serve jobs from a single queue.
# The time it takes one core to serve a randomly selected job is distributed as 1/5
#so that his average service time is 5 minutes. The other, more powerful core’s service times are distributed as
# 1/4, averaging 4 minutes. Cores work independently. Both cores are busy and a new job arrives in the queue.

total <- 0
numtrials <- 10000
for(i in 1:numtrials){
    core1 <- rexp(1,0.2)
    core2 <- rexp(1,0.25)
    if( (core1 > 5) | (core2 > 5)){
        total <- total + 1
    }
}
print(total/numtrials)
