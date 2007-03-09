\name{sR.sC}
\alias{sR.sC}
\title{ Compute Regression Parameters }
\description{
Compute an array of regression parameters from an array 
of correlation parameters. 
}
\usage{
sR.sC(sC)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{sC}{ a p x p x nsamp array of, made up of nsamp correlation matrices.  }
}
\details{
For each of the nsamp correlation matrices C, a matrix of regression 
parameters is computed via \code{R[j,-j]<- C[j,-j]\%*\%solve(C[-j,-j]) }
}
\value{
a p x p x nsamp array of regression parameters. 
}
\author{ Peter Hoff }
\keyword{array }% at least one, from doc/KEYWORDS
\keyword{multivariate}
\keyword{regression}
