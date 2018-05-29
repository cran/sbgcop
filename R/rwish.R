#' Sample from the Wishart Distribution
#' 
#' Generate a random sample from the Wishart distribution.
#' 
#' Return the sum of nu i.i.d.  rank-one matrices generated as \code{z\%*\%t(z)},
#' where \code{z} is a sample from a multivariate normal distribution with
#' covariance \code{S0}. The resulting random variable has mean \code{nu*S0}.
#' 
#' @param S0 a positive definite matrix
#' @param nu a positive integer
#' @return a positive definite matrix.
#' @author Peter Hoff
#' @keywords distribution multivariate datagen
"rwish" <-
function(S0,nu){       # sample from a Wishart distribution
sS0<-chol(S0)
Z<-matrix(rnorm(nu*dim(S0)[1]),nu,dim(S0)[1])%*%sS0
t(Z)%*%Z                     }

