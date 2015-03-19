rankhospital <- function(state, outcome, num = "best" ){
        
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        valid_outcomes <- c('heart attack', 'heart failure', 'pneumonia')
        if (!state %in% data$State) {stop("invalid state")}
        if (!outcome %in% data$valid_outcomes) {stop("invalid outcome")}
        
        
        data <- data[data$State==state,]
        if (outcome == 'heart attack') {
                death <- as.numeric(data[,11])
        } else if (outcome == 'heart failure') {
                death <- as.numeric(data[,17])
        } else if (outcome == 'pneumonia') {
                death <- as.numeric(data[,23])
        }
        
        a <- rank(death, na.last=NA)
        
        if (num=="best") {
                r <- 1
        } else if (num =="worst") {
                r <- length(a)
        } else if (num <= length(a) ) {
                r <- num
        }
        
        return(data$Hospital.Name[order(death, data$Hospital.Name)[r]])
}