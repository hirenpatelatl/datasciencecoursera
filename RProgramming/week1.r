setwd("~/GitHub/datasciencecoursera/RProgramming")
getwd()

myfunction <- function(x) {
	y <- rnorm(100)
	mean(y)
}

second <- function(x) {
	x + rnorm(length(x))
}

.week1.notes = function () {

## week1 notes
#	R has 5 basic or atomic classes of objects
#	character
#	numeric (real numbers)
#	integer
#	complex
#	logical

}
| Combining our knowledge of logical operators with our new knowledge of subsetting, we could do this -- x[!is.na(x)
| & x > 0]. Try it out.

> x[!is.na(x) & x>0]
 [1] 0.09224483 1.38723367 1.13011906 0.40307906 1.32513086 1.40402846 0.29779849 1.41755547 0.31499829 0.91366640
[11] 1.56601290

| Luckily, R accepts negative integer indexes. Whereas x[c(2, 10)] gives us ONLY the 2nd and 10th elements of x,
| x[c(-2, -10)] gives us all elements of x EXCEPT for the 2nd and 10 elements.  Try x[c(-2, -10)] now to see this.

> x[c(-2,-10)]
 [1]  0.09224483          NA          NA          NA  1.13011906 -0.43891383          NA -0.44685073  0.40307906
[10]          NA          NA          NA          NA          NA -0.01594939          NA          NA  1.32513086
[19]  1.40402846 -0.43479580  0.29779849          NA          NA          NA          NA -0.19864828  1.41755547
[28]  0.31499829 -0.21510509  0.91366640 -0.11101489  1.56601290          NA -0.34547524          NA          NA
[37]          NA -0.83072709

| Perseverance, that's the answer.

