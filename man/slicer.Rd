% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/interpreter.R
\name{slicer}
\alias{slicer}
\title{Recognise Multiple Patterns in a sinlge  time series}
\usage{
slicer(data, length, step = 1, useriq = FALSE, ...)
}
\arguments{
\item{data}{Time series Data}

\item{length}{Length of the 'windows'}

\item{step}{Number of Data Points between windows}

\item{useriq}{User-built recognition function. Set to \code{FALSE} if using inbuilt recognition capabilities.
Refer to the readme or the report on how to build your own recognition function}

\item{...}{Parameters passed on to either the inbuilt or external recognition function. Check \link{iq} for the parameters.}
}
\value{
A list containing: \itemize{
 \item{A vector for every window analysed showing 0 if no pattern and 1 if at least 1 pattern has been found.}
 \item{A vector with the starting index of those windows where a pattern has been found.}
}
}
\description{
Break time series data into smaller 'windows' and pass them to the \link{interpret} function.
The results are summarised in the output. For details, run \link{interpret} on specific windows only.
}
\details{
For an overview of the package capabilities, click here \link{rpatrec}
}
\examples{
\dontrun{
#Generate 2 HS patterns
a <- c(generator(),generator())
#recognise both HS patterns
#set window size to 100, step size to 100
#switch off recognition for all patterns other than HS
slicer(data = a, length = 100, step = 100, hsiq=TRUE, btpiq=FALSE, rtpiq=FALSE, dtpiq=FALSE)
}

}
