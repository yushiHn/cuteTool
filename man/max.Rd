% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/max.R
\name{max}
\alias{max}
\title{max}
\usage{
max(x, na.rm = FALSE, finite = FALSE)
}
\arguments{
\item{x}{Numeric or logical vector or matrix or numeric table where find the initial values to use.}

\item{na.rm}{Single logical value. Should missing values (NA and NaN) be removed ?}

\item{finite}{Single logical value. Should infinite values (Inf and -Inf) be removed ? Warning: this argument does not remove NA and NaN. Please use the na.rm argument.}
}
\value{
The maximum value of the given arguments.
}
\description{
Find and return the maximum value of a set of data.
}
\details{
REQUIRED PACKAGES

none


REQUIRED FUNCTIONS FROM THE cute PACKAGE

none
}
\examples{
vec <- c(1:3) ; max(x = vec)

vec <- c(1,3,5,TRUE, FALSE, NA) ; max(x = vec, na.rm = TRUE)


# This example returns an error because of the character in the vector
# vec <- c(1,3,5,TRUE,"apple") ; max(x = vec)

# This example returns an error because of the argument na.rm, when the function max() of the package base doesn't return an error
# vec <- c(1,3,5,TRUE) ; max(x = vec, na.rn = TRUE)
}
