#' Log Multivariate Normal Density
#' 
#' Computes the log of the multivariate normal density
#' 
#' This function computes the log density of the data matrix \code{Y} under the
#' model that the rows are independent samples from a mean-zero multivariate
#' normal distribution with covariance matrix \code{S}.
#' 
#' @param Y an n x p matrix
#' @param S a p x p positive definite matrix
#' @return A real number.
#' @author Peter Hoff
#' @keywords distribution multivariate
#' @examples
#' 
#' Y<-matrix(rnorm(9*7),9,7) 
#' ldmvnorm(Y,diag(7))
#' 
#' 
#' 
"ldmvnorm" <-
function(Y,S) {     # log density of a matrix with mvn rows
 n<-dim(Y)[1]
 p<-dim(Y)[2]
 -.5*n*log(det(S)) -.5*n*p*log(2*pi)-.5*sum( diag( solve(S)%*%t(Y)%*%Y)) }

