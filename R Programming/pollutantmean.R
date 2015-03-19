pollutantmean <- function(directory, pollutant, id = 1:332){
	specdatafile <- "/Users/ronibarakventura/Desktop/specdata/"
	data = numeric()
	for (i in id)
		{
		file = read.csv(paste(specdatafile, formatC(i, width = 3, flag = "0"), ".csv", sep = ""))
		data = c(data, file[[pollutant]])
		}
	return(print(mean(data, na.rm = TRUE), digits = 4))
}