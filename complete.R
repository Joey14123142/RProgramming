complete <- function(directory, id = 1:332){
  nobs <- numeric()
  for (i in id){
    files <- read.csv(paste0(directory,"/",
                             formatC(i, width = 3, flag = "0"),".csv"))
    nobs = c(nobs,sum(complete.cases(files)))
  }
  return(data.frame(id, nobs))
}

complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)

cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)

cc <- complete("specdata", 54)
print(cc$nobs)

set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])