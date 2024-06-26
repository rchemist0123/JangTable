% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/nDistinct.R
\name{nDistinct}
\alias{nDistinct}
\title{Count number of distinct values of variable(s).}
\usage{
nDistinct(x)
}
\arguments{
\item{x}{Vectors to check number of distinct values.}
}
\description{
Create a table of unique values of selected variables. Compatible with data.table.
}
\examples{
library(data.table)
as.data.table(mtcars)[,nDistinct(cyl)]
as.data.table(mtcars)[,nDistinct(.SD)]
as.data.table(mtcars)[,lapply(.SD, nDistinct)]
}
