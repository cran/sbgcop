\name{sbgcop-package}
\alias{sbgcop-package}
\alias{sbgcop}
\docType{package}
\title{
Semiparametric Bayesian Gaussian copula estimation and imputation
}
\description{
 This package estimates parameters of a Gaussian
        copula, treating the univariate marginal distributions
        as nuisance parameters as described in Hoff(2007). It also
        provides a semiparametric imputation procedure for missing
       multivariate data.
}
\details{
\tabular{ll}{
Package: \tab sbgcop\cr
Type: \tab Package\cr
Version: \tab 0.975 \cr
Date: \tab 2010-03-08\cr
License: \tab GPL Version 2 or later \cr
}
This function produces MCMC samples from the posterior
distribution of a correlation matrix, using a scaled
inverse-Wishart prior distribution and an extended rank 
likelihood. It also provides imputation for missing values
in a multivariate dataset.
}
\author{
Peter Hoff <hoff@stat.washington.edu>
}
\references{
 Hoff (2007) ``Extending the rank likelihood for semiparametric copula estimation''
}
\keyword{ multivariate }
\examples{

fit<-sbgcop.mcmc(swiss)
summary(fit)
plot(fit)

}
