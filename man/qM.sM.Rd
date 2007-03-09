\name{qM.sM}
\alias{qM.sM}
\title{ Matrix Quantiles  }
\description{
Computes quantiles  along the third dimension of a 3-d array. 
}
\usage{
qM.sM(sM, quantiles = c(0.025, 0.5, 0.975))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{sM}{  an  m x n x s array }
  \item{quantiles}{ quantiles to be computed}
}
\value{
an array of dimension m x n x l, where l is the length of 
    \code{quantiles}
}
\author{ Peter Hoff }
\keyword{array}% at least one, from doc/KEYWORDS
\keyword{multivariate}
