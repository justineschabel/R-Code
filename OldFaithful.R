
setwd("/Users/justine/Desktop/UC\ Davis/Spring18/Stats/homework3/") 

# Analysis of the Old Faithful data set 
#Read Data 
data <- read.table("Old_Faithful.txt", header=TRUE) 

#Plot Histogram
hist(data[,3], freq = FALSE, xlab = "Bin", ylab = "Duration", main = "Eruption Duration")

#Plot BoxPlot 
boxplot(data[,3], main = "Boxplot of Eruption Duration")

#Look at different quantiles
q = c(.95,.97,.99)
quantile(data[,3], q)


v <- c(data[,3])
copy <- c(v)
for(i in 1:length(v)){
  if(v[i] <= 3){
    copy[i] <- 0
  }else{
    copy[i] <- 1  
  }
}
countLL <- 0
countLS <- 0
countSL <- 0
countSS <- 0
countS <- 0
countL <- 0

for(i in 1:220){
  if(copy[i]){
    if(copy[i+1] > 0){
    countLL <- countLL + 1
    }else{
      countLS <- countLS + 1
    }
  }else if(copy[i+1]){
    countSL <- countSL + 1
  }
  else{
    countSS <- countSS + 1
  }
  ifelse(copy[i], countL <- countL + 1, countS <- countS + 1)
}
total <- countL + countS
#Probability of long/short sequence of eruptions 
print(countLL/total) # long long
print(countLS/total) # long short
print(countSL/total) # short long
print(countSS/total) # short short