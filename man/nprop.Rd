% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/nProp.R
\name{nProp}
\alias{nProp}
\title{Print frequency and proportion of a vector}
\usage{
nProp(x, digits = 1, missing = FALSE)
}
\arguments{
\item{x}{A vector to check frequency and proportion}

\item{digits}{A digit for proportions}

\item{missing}{Whether considering NA values. Default is FALSE.}
}
\description{
Create a table that checks the n, proportion of a vector. Compatible with data.table.
}
\examples{
library(data.table)
as.data.table(mtcars)[,nProp(cyl)]

}
