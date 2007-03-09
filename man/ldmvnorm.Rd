\name{ldmvnorm}
\alias{ldmvnorm}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Log Multivariate Normal Density }
\description{
Computes the log of the multivariate normal density 
}
\usage{
ldmvnorm(Y, S)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Y}{ an n x p matrix  }
  \item{S}{ a p x p positive definite matrix  }
}
\details{
This function computes the log density of the data matrix \code{Y}
under the model that the rows are independent samples from a 
mean-zero multivariate normal distribution with covariance matrix 
\code{S}. 
}
\value{
A real number. 
}
\author{ Peter Hoff  }
\examples{
Y<-matrix(rnorm(9*7),9,7) 
ldmvnorm(Y,diag(7))


}
\keyword{distribution}% at least one, from doc/KEYWORDS
\keyword{multivariate}

