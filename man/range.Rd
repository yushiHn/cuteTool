% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/range.R
\name{range}
\alias{range}
\title{range}
\usage{
range(x, na.rm = FALSE, finite = FALSE)
}
\arguments{
\item{x}{Numeric or logical vector or matrix or numeric table where find the initial values to use.}

\item{na.rm}{Single logical value. Should missing values (NA and NaN) be removed ?}

\item{finite}{Single logical value. Should infinite values (Inf and -Inf) be removed ? Warning: this argument does not remove NA and NaN. Please use the na.rm argument.}
}
\value{
The minimum value and the maximum value of the given arguments.
}
\description{
Find and return the minimum value and the maximum value of a set of data.
}
\details{
REQUIRED PACKAGES

none


REQUIRED FUNCTIONS FROM THE cute PACKAGE

none
}
\examples{
vec <- c(1:3) ; range(x = vec)

vec <- c(1,3,5,TRUE) ; range(x = vec)


# This example returns an error because of the character in the vector
# vec <- c(1,3,5,TRUE,"apple") ; range(x = vec)
}
