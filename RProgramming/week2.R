add2 <- function(x,y) {
	x + y
}
add3 <- function(x,y) {
	x + y
}

above10 <- function(x) {
	use <- x >10
	x[use]
}

above <- function (x,n=1){
	use <- x > n
	x[use]
}
columnmean <- function(y) {
	nc<- ncol(y)
	means <- numeric(nc)
	for(i in 1:nc)
	{
		means[i]<- mean(y[,i])
	}
	means
}
