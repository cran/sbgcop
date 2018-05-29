#' Compute Regression Parameters
#' 
#' Compute an array of regression parameters from an array of correlation
#' parameters.
#' 
#' For each of the nsamp correlation matrices C, a matrix of regression
#' parameters is computed via \code{R[j,-j]<- C[j,-j]\%*\%solve(C[-j,-j]) }
#' 
#' @param sC a p x p x nsamp array of, made up of nsamp correlation matrices.
#' @return a p x p x nsamp array of regression parameters.
#' @author Peter Hoff
#' @keywords array multivariate regression
#'
#' @examples
#'
#' fit<-sbgcop.mcmc(swiss)
#'
#' plotci.sA(sR.sC(fit$C.psamp))
#'
#'
"sR.sC" <-
function(sC) {
p<-dim(sC)[1]
s<-dim(sC)[3]
sR<-array(dim=c(p,p,s) )
dimnames(sR)<-dimnames(sC)

for(l in 1:s) {

C<-sC[,,l]
R<-C*NA
for(j in 1:p){
R[j,-j]<- C[j,-j]%*%solve(C[-j,-j])
             }
sR[,,l]<-R     
              }
sR                    }

