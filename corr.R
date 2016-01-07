source("complete.R")


corr <- function(directory, threshold = 0){
  df <- complete(directory)
  id <- df[df$nobs>threshold,]$id
  cors <- numeric()
  for (i in id){
    files <- read.csv(paste0(directory,"/",
                             formatC(i, width = 3, flag = "0"),".csv"))
    case <- files[complete.cases(files),]
    cors <- c(cors, cor(case$sulfate,case$nitrate))
  }
  return(cors)
}

cr <- corr("specdata", 150)


# 8 -----------------------------------------------------------------------

cr <- corr("specdata")                
cr <- sort(cr)                
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)


# 9 -----------------------------------------------------------------------

cr <- corr("specdata", 129)                
cr <- sort(cr)                
n <- length(cr)                
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)


# 10 ----------------------------------------------------------------------

cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))

