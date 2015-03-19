complete <- function(directory, id = 1:332){
	nobs <- function(id){
		data <- file.path(specdatafile, paste(sprintf("%03d", as.numeric(id)), ".csv", sep = ""))
		return(sum(complete.cases(read.csv(data))))
	}
	return(data.frame(id=id, nobs = sapply(id, nobs)))
}