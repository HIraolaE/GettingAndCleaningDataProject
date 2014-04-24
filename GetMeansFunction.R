##Create a function that returns the means data frame from the tidy data frame
getMeansDF <- function(x) {
  dfFinal <- data.frame()
  for(i in 1:length(x)){
    ## Take each data frame of the combination of Subject and activity.
    temp <- x[[i]]
    ## Get subject and activity values
    isubject <- temp[[1]][1]
    iactivity <- temp[[68]][1]
    ## Create a row and add the values
    dfRow <- data.frame()
    dfRow <- data.frame(isubject)
    for (j in 2:67){
      ## calculate and add the mean values
      tempValues <- temp[[j]]
      dfRow <- data.frame(dfRow,mean(tempValues))
    }
    ## add the activity 
    dfRow <- data.frame(dfRow,iactivity)
    ## add the row to  the returning data frame
    dfFinal <- rbind(dfFinal, dfRow)
  }
  names(dfFinal) <- names(x[[1]])
  dfFinal
}