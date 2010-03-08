\name{sbgcop.mcmc}
\alias{sbgcop.mcmc}
\alias{plot.psgc}
\alias{summary.psgc}
\alias{print.sum.psgc}
\title{Semiparametric Bayesian Gaussian copula estimation and imputation}
\description{
\code{sbgcop.mcmc} is used to semiparametrically estimate the
parameters of a Gaussian copula. It can be used for posterior
inference on the copula parameters, and for imputation of
missing values in a matrix of ordinal and/or continuous values.
}
\usage{
sbgcop.mcmc(Y, S0 = diag(dim(Y)[2]), n0 = dim(Y)[2] + 2, nsamp = 100,
  odens = max(1, round(nsamp/1000)), 
 impute=any(is.na(Y)),
 plugin.threshold=100,
 plugin.marginal=(apply(Y,2,function(x){ length(unique(x))})>plugin.threshold),
seed = 1, verb = TRUE)
}
\arguments{
  \item{Y}{ an n x p matrix. Missing values are allowed.   }
  \item{S0}{ a p x p positive definite matrix }
  \item{n0}{ a positive integer }
  \item{nsamp}{ number of iterations of the Markov chain. }
  \item{odens}{ output density: number of  iterations  between
       saved samples.  }
\item{impute}{ save posterior predictive values of missing data(TRUE/FALSE)? }
\item{plugin.threshold}{ if the number of unique values of a variable exceeds this integer, then plug-in the empirical distribution as the marginal. }
\item{plugin.marginal}{ a logical of length p. Gives finer control over 
which margins to use the empirical distribution for.}
 \item{seed}{ an integer for the random seed}
 \item{verb}{ print progress of MCMC(TRUE/FALSE)? }
}
\details{
This function produces MCMC samples from the posterior
distribution of a correlation matrix, using a scaled 
inverse-Wishart prior distribution and an extended rank
likelihood. It also provides imputation for missing values 
in a multivariate dataset. 
}
\value{
 An object of class \code{psgc} containing the following components:
\item{C.psamp }{an array of size p x p x \code{nsamp/odens},
   consisting of posterior samples of the correlation matrix.  }
  \item{Y.pmean }{the original datamatrix with imputed
                   values replacing missing data   }
  \item{Y.impute }{ an array of size n x p x \code{nsamp/odens},
   consisting of copies of the original data matrix, with posterior samples of missing values included. }
  \item{LPC }{the log-probability of the latent variables at each
      saved sample. Used for diagnostic purposes.   }
}
\references{http://www.stat.washington.edu/hoff/}
\author{Peter Hoff }
\examples{
fit<-sbgcop.mcmc(swiss)
summary(fit)
plot(fit)
}
\keyword{ multivariate }
\keyword{ models }
