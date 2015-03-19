best <- function(state, outcome_name){
        outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        valid_outcomes <- c('heart attack', 'heart failure', 'pneumonia')
        
        if (!state %in% outcome$State) {stop("invalid state")}
        if (!outcome_name %in% valid_outcomes) {stop("invalid outcome")}
        
        data <- outcome[outcome$State==state,]
        if (outcome_name == 'heart attack') {
                death <- as.numeric(data[,11])
        } else if (outcome_name == 'heart failure') {
                death <- as.numeric(data[,17])
        } else if (outcome_name == 'pneumonia') {
                death <- as.numeric(data[,23])
        }
        
        
        index <- which(death == min(death, na.rm=T))
        
        return(data$Hospital.Name[index])
}