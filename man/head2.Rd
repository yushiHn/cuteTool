% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/head2.R
\name{head2}
\alias{head2}
\title{head2}
\usage{
head2(data1, n = 6, side = "l")
}
\arguments{
\item{data1}{Any object but more dedicated for matrix, data frame or table.}

\item{n}{As in head2() but for for matrix, data frame or table, number of dimension to print (10 means 10 rows and columns).}

\item{side}{Either "l" or "r" for the left or right side of the 2D object (only for matrix, data frame or table).}
}
\value{
The head.
}
\description{
As head2() but display the left or right head of big 2D objects.
}
\details{
REQUIRED PACKAGES

cuteDev


REQUIRED FUNCTIONS FROM THE cute PACKAGE

arg_check()


BEWARE

Other arguments of head() not used.
}
\examples{
obs1 = matrix(1:30, ncol = 5, dimnames = list(letters[1:6], LETTERS[1:5])) ; 
obs1 ; 
head2(obs1, 3)
}
