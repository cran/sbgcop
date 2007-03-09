\name{rwish}
\alias{rwish}
\title{ Sample from the Wishart Distribution  }
\description{
Generate a random sample from the Wishart distribution. 
}
\usage{
rwish(S0, nu)
}
\arguments{
  \item{S0}{ a positive definite matrix  }
  \item{nu}{ a positive integer }
}
\details{
Return the sum of nu  i.i.d.  rank-one matrices 
generated as \code{z\%*\%t(z)}, where \code{z} is a sample 
from a multivariate normal distribution with covariance 
\code{S0}. The resulting random variable has mean 
 \code{nu*S0}. 
         }
\value{
 a positive definite matrix. 
}
\author{ Peter Hoff }
\keyword{distribution}% at least one, from doc/KEYWORDS
\keyword{multivariate}
\keyword{datagen}
