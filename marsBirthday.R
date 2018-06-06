#Modified birthday paradox simulation (669 days/year)

n.same <- 0
#Number of people born on Mars 
numberofpeople <- 44
probability <- numeric(numberofpeople)
#See how the probability changes with the number of people born on mars
for(k in 1:numberofpeople){
  n.sameday <- 0
  #run 3000 experiments with k people at a time 
  numexps <- 3000
  for (exp in 1:numexps){
    #get k random days out of the 669 days of the year
    birthdays <- sample(1:669, k, replace = TRUE)
    #if there are any duplicate dates, at least 2 people have the same birthday 
    if(length(birthdays[duplicated(birthdays)]) > 0){
      n.same <- n.same + 1
    }
  }
  probability[k] <- n.same/numexps
  #reset for the next number of people
  n.same <- 0
}
print(probability[numberofpeople])
plot(1:numberofpeople, probability, type="l")