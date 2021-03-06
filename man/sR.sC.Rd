% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sR.sC.R
\name{sR.sC}
\alias{sR.sC}
\title{Compute Regression Parameters}
\usage{
sR.sC(sC)
}
\arguments{
\item{sC}{a p x p x nsamp array of, made up of nsamp correlation matrices.}
}
\value{
a p x p x nsamp array of regression parameters.
}
\description{
Compute an array of regression parameters from an array of correlation
parameters.
}
\details{
For each of the nsamp correlation matrices C, a matrix of regression
parameters is computed via \code{R[j,-j]<- C[j,-j]\%*\%solve(C[-j,-j]) }
}
\examples{

fit<-sbgcop.mcmc(swiss)

plotci.sA(sR.sC(fit$C.psamp))


}
\author{
Peter Hoff
}
\keyword{array}
\keyword{multivariate}
\keyword{regression}
