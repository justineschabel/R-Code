#We want to send a secret message through a packet channel by modifying the interpacket delays to encode 0s and 1s. 
#Here we use a delay of 0.25 to encode a 0 and 0.75 to encode a 1

#Set working directory
setwd("/Users/justine/Desktop/UC DAVIS/Spring18/Stats/Project")

#Read in the CSV
data <-read.table("Traffic_data_orig.csv",header=TRUE, sep = ',')

#Get the incoming packet times 
overt <- data$Time

#Get the interpacket delays
difference <- c(500)
for(i in 1:500){
  difference[i] <- (overt[i+1] - overt[i])
}

#Convert the secret message to binary
message <- "this is a secret message"
y <- charToRaw(message)
rawbits <- rawToBits(y)

covert <- c(overt) 
#2 - 192 Alter the overt channel by adding delays 
for( i in 2:(length(rawbits)+1)){
  if(rawbits[i] == 0){
    covert[i] = 0.25 + covert[i-1]
  }
  if(rawbits[i] == 1){
    covert[i] = 0.75 + covert[i-1]
  }
}

#193 - 501 Fix the rest of the packet times to adjust for delays of message 
covert[193] = covert[192] + difference[193]
for(i in 194:length(covert)){
  covert[i] = covert[i-1] + difference[i]
}
covert[501] = covert[500] + difference[500]

#Get the interpacket delays of covert
difference2 <- c(500)
for(i in 1:500){
  difference2[i] <- (covert[i+1] -  covert[i])
}

#Go from modified IPD -> bits and compare to rawbits (the raw converted message)
undo <- vector()
for(i in 1:192){
  if(difference2[i] == 0.25){
    undo <- append(undo, 0)
  }else{
    undo <- append(undo, 1)
  }
}

#Here we show the original message bit pattern and we also show the bit pattern generated by the covert IPDs. This demonstrates that our program to produce the modified IPDs sends the secret message correctly.
print(as.numeric(rawbits))
print(undo)

hist(difference, xlab='Interpacket Delay Bin', ylab='Number of Packets', main = 'Overt')
hist(difference2, xlab='Interpacket Delay Bin', ylab='Number of Packets', main = 'Covert')