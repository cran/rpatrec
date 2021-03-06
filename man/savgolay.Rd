% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/smoother3.R
\name{savgolay}
\alias{savgolay}
\title{Perform Savitzgy-Golay smoothing on Time Series Data}
\usage{
savgolay(input, width = 4, degree = 2)
}
\arguments{
\item{input}{Input Vector with Time Series Data}

\item{width}{Width of the filter (to each side of the centre)}

\item{degree}{Highest degree polynomial}
}
\value{
Vector containing smoothed time series data.
}
\description{
Use this function to smooth your time series data using local polynomial regression, as first pouplarised
by Savitzky and Golay (1964).
}
\details{
For an overview of the package capabilities, click here \link{rpatrec}.
See the report for detailed references
}
\examples{
savgolay(input=c(1,6,2,46,23,1,2,13,23,35,23,-2,3,23))
\dontrun{
#create a standard HS pattern:
a <- generator()
#add noise to this patterns
b <- noise(a,'white',10)
#smooth to regain the signal
c <- savgolay(b,8,2)
}


}
