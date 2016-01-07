pollutantmean <- function(directory, pollutant, id = 1:332){
  data <- numeric()
  for (i in id){
    files <- read.csv(paste0(directory,"/",
                             formatC(i, width = 3, flag = "0"),".csv"))
    data <- c(data, files[[pollutant]])
  }
  return(mean(data,na.rm = TRUE))
}


pollutantmean("specdata", "sulfate", 1:10)

pollutantmean("specdata", "nitrate", 70:72)

pollutantmean("specdata", "nitrate", 23)

pollutantmean("specdata", "sulfate", 1:10)

pollutantmean("specdata", "nitrate", 70:72)

pollutantmean("specdata", "sulfate", 34)

pollutantmean("specdata", "nitrate")



