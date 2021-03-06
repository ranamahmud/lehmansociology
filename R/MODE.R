#' Function for calculating the mode
#'
#' This function calculates the mode for a dataframe, supporting multiple data types and multiple modes.
#' @keywords mode class
#' @export
#' @examples
#'  MODE(mtcars)
#'  MODE(mtcars$hp)

MODE <- function(dataframe, Freq){
  df <- as.data.frame(dataframe)
  #based on stackoverflow.com/questions/2547402/standard-library-function-in-r-for-finding-the-mode

  MODE2 <- function(x){
    if (is.numeric(x) == FALSE){
      df <- as.data.frame(table(x))
      df <- df[order(df$Freq), ]
      m <- max(df$Freq)
      MODE1 <- as.vector(as.character(subset(df, Freq == m)[, 1]))

      if (sum(df$Freq)/length(df$Freq)==1){
        warning("No Mode: Frequency of all values is 1", call. = FALSE)
      }else{
        return(MODE1)
      }

    }else{
      df <- as.data.frame(table(x))
      df <- df[order(df$Freq), ]
      m <- max(df$Freq)
      MODE1 <- as.vector(as.numeric(as.character(subset(df, Freq == m)[, 1])))

      if (sum(df$Freq)/length(df$Freq)==1){
        warning("No Mode: Frequency of all values is 1", call. = FALSE)
      }else{
        return(MODE1)
      }
    }
  }

  return(as.vector(lapply(df, MODE2)))
}
