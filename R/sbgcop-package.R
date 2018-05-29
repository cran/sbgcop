#' Semiparametric Bayesian Gaussian Copula Estimation and Imputation
#' 
#' Estimation and inference for parameters in a Gaussian copula model, treating
#' univariate marginal distributions as nuisance parameters as described in
#' Hoff (2007) <doi:10.1214/07-AOAS107>. This pacakge also provides a 
#' semiparametric imputation procedure for
#' missing multivariate data.
#' 
#' \tabular{ll}{ Package: \tab sbgcop\cr Type: \tab Package\cr Version: \tab
#' 0.980 \cr Date: \tab 2018-05-25\cr License: \tab GPL Version 2 or later \cr
#' } This function produces MCMC samples from the posterior distribution of a
#' correlation matrix, using a scaled inverse-Wishart prior distribution and an
#' extended rank likelihood. It also provides imputation for missing values in
#' a multivariate dataset.
#' 
#' @name sbgcop-package
#' @aliases sbgcop-package sbgcop
#' @docType package
#' @author Peter Hoff <peter.hofff@@duke.edu>
#' @references Hoff (2007) ``Extending the rank likelihood for semiparametric
#' copula estimation''
#' @keywords multivariate
#' @examples
#' 
#' 
#' fit<-sbgcop.mcmc(swiss)
#' summary(fit)
#' plot(fit)
#' 
#' 
NULL



