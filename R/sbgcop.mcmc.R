#' Semiparametric Bayesian Gaussian copula estimation and imputation
#' 
#' \code{sbgcop.mcmc} is used to semiparametrically estimate the parameters of
#' a Gaussian copula. It can be used for posterior inference on the copula
#' parameters, and for imputation of missing values in a matrix of ordinal
#' and/or continuous values.
#' 
#' This function produces MCMC samples from the posterior distribution of a
#' correlation matrix, using a scaled inverse-Wishart prior distribution and an
#' extended rank likelihood. It also provides imputation for missing values in
#' a multivariate dataset.
#' 
#' @aliases sbgcop.mcmc plot.psgc summary.psgc print.sum.psgc
#' @param Y an n x p matrix. Missing values are allowed.
#' @param S0 a p x p positive definite matrix
#' @param n0 a positive integer
#' @param nsamp number of iterations of the Markov chain.
#' @param odens output density: number of iterations between saved samples.
#' @param impute save posterior predictive values of missing data(TRUE/FALSE)?
#' @param plugin.threshold if the number of unique values of a variable exceeds
#' this integer, then plug-in the empirical distribution as the marginal.
#' @param plugin.marginal a logical of length p. Gives finer control over which
#' margins to use the empirical distribution for.
#' @param seed an integer for the random seed
#' @param verb print progress of MCMC(TRUE/FALSE)?
#' @return An object of class \code{psgc} containing the following components:
#' \item{C.psamp }{an array of size p x p x \code{nsamp/odens}, consisting of
#' posterior samples of the correlation matrix.  } \item{Y.pmean }{the original
#' datamatrix with imputed values replacing missing data } \item{Y.impute }{ an
#' array of size n x p x \code{nsamp/odens}, consisting of copies of the
#' original data matrix, with posterior samples of missing values included. }
#' \item{LPC }{the log-probability of the latent variables at each saved
#' sample. Used for diagnostic purposes.  }
#' @author Peter Hoff
#' @references http://www.stat.washington.edu/hoff/
#' @keywords multivariate models
#' @examples
#' 
#' fit<-sbgcop.mcmc(swiss)
#' summary(fit)
#' plot(fit)
#' 
"sbgcop.mcmc" <-
function(Y,S0=diag(dim(Y)[2]),n0=dim(Y)[2]+2, 
 nsamp=100,odens=max(1,round(nsamp/1000)),impute=any(is.na(Y)),
 plugin.threshold=100,
 plugin.marginal=(apply(Y,2,function(x){ length(unique(x))})>plugin.threshold),
 seed=1,verb=TRUE){

########## check input
ok_S0<-all(eigen(S0)$val>0) & dim(S0)[1]==dim(Y)[2] & dim(S0)[2]==dim(Y)[2]
ok_n0<-(n0>=0)

if(!ok_S0) { cat("Error: S0 must be a positive definite p x p matrix \n") }
if(!ok_n0) { cat("Error: n0 must be positive \n") }

if(ok_S0 & ok_n0) {

########## data
vnames<-colnames(Y) 
Y<-as.matrix(Y)
colnames(Y)<-vnames
n<-dim(Y)[1]
p<-dim(Y)[2]
##########

########## starting values
set.seed(seed)
R<-NULL
for(j in 1:p) { R<-cbind(R, match(Y[,j],sort(unique(Y[,j])))) }
Rlevels<-apply(R,2,max,na.rm=TRUE)
Ranks<- apply(Y,2,rank,ties.method="max",na.last="keep")
N<-apply(!is.na(Ranks),2,sum)
U<- t( t(Ranks)/(N+1))
Z<-qnorm(U)
Zfill<-matrix(rnorm(n*p),n,p)
Z[is.na(Y)]<-Zfill[is.na(Y) ]
S<-cov(Z)
##########

########## things to keep track of
Y.pmean<-Y
if(impute){Y.pmean<-matrix(0,nrow=n,ncol=p)}
LPC<-NULL
C.psamp<-array(dim=c(p,p,floor(nsamp/odens)))
Y.imp<-NULL
if(impute){Y.imp<-array(dim=c(n,p,floor(nsamp/odens) )) }
dimnames(C.psamp)<-list(colnames(Y),colnames(Y),1:floor(nsamp/odens))
##########

########## start MCMC
for(ns in 1:nsamp) {

#### update Z
for(j in sample(1:p)) {
Sjc<- S[j,-j]%*%solve(S[-j,-j])
sdj<- sqrt( S[j,j] -S[j,-j]%*%solve(S[-j,-j])%*%S[-j,j]  )
muj<- Z[,-j]%*%t(Sjc)

if(!plugin.marginal[j])
{
  for(r in 1:Rlevels[j]){
  ir<- (1:n)[R[,j]==r & !is.na(R[,j])]
  lb<-suppressWarnings(max( Z[ R[,j]==r-1,j],na.rm=TRUE))
  ub<-suppressWarnings(min( Z[ R[,j]==r+1,j],na.rm=TRUE))
  Z[ir,j]<-qnorm(runif(length(ir),
           pnorm(lb,muj[ir],sdj),pnorm(ub,muj[ir],sdj)),muj[ir],sdj)
                       }
}
ir<-(1:n)[is.na(R[,j])]
Z[ir,j]<-rnorm(length(ir),muj[ir],sdj)
                          }
#### 

#### update S
S<-solve(rwish(solve(S0*n0+t(Z)%*%Z),n0+n))
####

#### save results
if(ns %% odens ==0) {
C<-S/(sqrt(diag(S))%*%t(sqrt(diag(S))))

lpc<-ldmvnorm(Z%*%diag(1/sqrt(diag(S))),C)
LPC<-c(LPC,lpc)
C.psamp[,,ns/odens]<-C

if(impute)
{
Y.imp.s<-Y
for(j in 1:p) {
Y.imp.s[is.na(Y[,j]),j]<-quantile(Y[,j],
                       pnorm(Z[is.na(Y[,j]),j],0,sqrt(S[j,j])),na.rm=TRUE,type=1)
               }
Y.imp[,,ns/odens]<-Y.imp.s
Y.pmean<-  ( (ns/odens-1)/(ns/odens) )*Y.pmean+  (1/(ns/odens) )*Y.imp.s 
}
                  }

if(verb==TRUE & (ns %%(odens*10))==0){
        cat(round(100*ns/nsamp),"percent done ",date(),"\n")
                                     }
####

         }
##########

G.ps<-list(C.psamp=C.psamp,Y.pmean=Y.pmean,Y.impute=Y.imp,LPC=LPC)
class(G.ps)<-"psgc"
return(G.ps)
              }
}

