#'Test how well a smoother can filter noise from data
#'
#'Use this function to find out about the rate of successful recognition of a simple HS pattern for any smoothing function
#'of your choice. Speciffy the noise and other testing conditions.
#'
#'For an overview of the package capabilities, click here \link{rpatrec}.
#'Note that this function may be extremely computationally demanding.
#'
#'@param n number of runs
#'@param m number of runs per level of noise
#'@param incr value by which the error is increased in each turn
#'@param max max number of times the error is increased
#'@param smoother Function with pre-defined inputs, so that only the parameter \code{input} is left to be defined
#'@param pattern Check whether pattern was recognised. If \code{FALSE} only the correct position of extrema is checked.
#'@param ntype Noise type. See \code{noise} function for details.
#'@param ... other parameters the smoother requires
#'
#'@return Vector of recognition rates for specified levels of noise
#'
#'@examples
#'\dontrun{
#'#Test the kernel regression smoother
#'a <- test.smoother(n=5,m=10,incr=0.5,max=50,smoother = kernel,bandwidth=1)
#'#Plot the result
#'plot(a,type='l')
#'}
#'
#'@export
test.smoother <- function(n = 1, m = 5, incr = 1, max = 20, smoother, pattern = TRUE,
  ntype = "white", ...) {
  dots <- list(...)
  result <- rep(0, max)
  for (i in 1:n) {
    pat <- generator()
    r <- 1
    zero <- 0
    nresult <- vector()
    while (r <= max && zero < (3 * m)) {
      curerror <- r * incr
      # print(curerror)
      count <- 0
      for (j in 1:m) {
        epat <- noise(pat, ntype, curerror)
        spat <- smoother(input = epat, ...)
        reci <- interpret(spat)
        rec <- reci[[3]]
        #### if checks
        #check whether the pattern has been recognised
        # if the function is savgolay, adjust the index (ie. if the predefined argument no 2 is 4)
        if (formals(smoother)[[2]] == 4)
          rec <- rec + dots$width
        # if the function is a moving averge, adjust the index (ie. if the predefined
        # argument no 2 is 10)
        if (formals(smoother)[[2]] == 10)
          rec <- rec + dots$len/2

        status <- FALSE
        if (length(rec) == 5) {
          if (rec[1] > 12 && rec[1] < 18) {
          if (rec[2] > 22 && rec[2] < 28) {
            if (rec[3] > 47 && rec[3] < 53) {
            if (rec[4] > 72 && rec[4] < 78) {
              if (rec[5] > 82 && rec[5] < 88) {
              if (pattern == TRUE) {
                if (!is.na(reci[[4]][[1]][1]))status <- TRUE
              }
              else status <- TRUE
              }
            }
            }
          }
          }
        }
        #### end if checks
        if (status == TRUE) {
          count <- count + 1
          zero <- 0
        }
        else zero <- zero + 1
      }
      nresult[r] <- count/m * 100
      r <- r + 1
    }
    for (k in 1:length(nresult)) {
      result[k] <- nresult[k] + result[k]
    }
  }
  result <- result/n
  return(result)
}


