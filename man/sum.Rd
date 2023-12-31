% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sum.R
\name{sum}
\alias{sum}
\title{sum}
\usage{
sum(x, na.rm = FALSE, finite = FALSE)
}
\arguments{
\item{x}{Numeric or logical vector or matrix or numeric table where find the initial values to calculate.}

\item{na.rm}{Single logical value. Should missing values (NA and NaN) be removed ?}

\item{finite}{Single logical value. Should infinite values (Inf and -Inf) be removed ? Warning: this argument does not remove NA and NaN. Please use the na.rm argument.}
}
\value{
The sum of the given arguments. Returns NA if the input contains NA and the argument na.rm = TRUE, else returns a value.
}
\description{
Calculate the sum of numeric and logical value.
}
\details{
REQUIRED PACKAGES

none


REQUIRED FUNCTIONS FROM THE cute PACKAGE

none
}
\examples{
vec <- c(1:3) ; sum(x = vec)

vec <- c(1,3,5,TRUE) ; sum(x = vec)



# This example returns an error because of the character in the vector
# vec <- c(1,3,5,TRUE,"apple") ; sum(x = vec)
}
