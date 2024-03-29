% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/multReg.R
\name{multReg}
\alias{multReg}
\title{Fit a multivariable logistic regression or Cox regression}
\usage{
multReg(data, outcome, vars, time = NULL)
}
\arguments{
\item{data}{A data for analysis.}

\item{outcome}{Name of a dependent variable or an outcome variable.}

\item{vars}{Names of independent variables or response variables.}

\item{time}{Observation duration variable. If not NULL, cox regression. Default is NULL.}
}
\value{
A glm or coxph object
}
\description{
Perform a multivariable logistic regression or Cox regression
}
