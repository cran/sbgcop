\name{plotci.sA}
\alias{plotci.sA}
\title{Plot Confidence Bands for Association Parameters}
\description{
Plots 95% confidence bands based on an array of association 
parameters
}
\usage{
plotci.sA(sA, ylabs = colnames(sA[, , 1]), mgp = c(1.75, 0.75, 0))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{sA}{ a p x p x nsamp array  }
  \item{ylabs}{a p x 1 vector of names for plotting labels }
  \item{mgp}{ margin parameters }
}
\author{ Peter Hoff }
\keyword{ array }% at least one, from doc/KEYWORDS
