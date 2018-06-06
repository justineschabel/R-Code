#Simulation of the birthday paradox
probs <- numeric(1000)
myday <- sample(1:365, 1)
# Run the experiment on various values of k
for (k in 1:1000) { 
  # Create a factor called days, that can take on any value from 1-365
  days <- c(1:365)
  # Run many, many experiments to get an accurate estimate
  n.same <- 0
  numexps <- 1000
  for (exp in 1:numexps) {
    # randomly get k birthdays, other people can have the same birthday so we have replacement
    birthdays <- sample(days, k, replace = TRUE)
    #if my birthday is not in the birthdays we sampled, no one has my birthday
    #if my birthday is in birthays, someone else has my birthday
    if(is.element(myday, birthdays)){
      n.same = n.same + 1
    }
  }
  
  probs[k] <- (n.same / numexps)
}
plot(1:1000, probs, type="l")
