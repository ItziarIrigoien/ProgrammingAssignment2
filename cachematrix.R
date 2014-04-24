## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
# Here we give some "properties" to a matrix
makeCacheMatrix <- function(x = matrix()) {
# Input:
#       x
# Output:
#       list of functions related with matrix x
  x.inv <- NULL
  set <- function(y)
  {
     x <<- y
     x.inv <<- NULL
  }
  get <- function() x
  setinv <- function(inverse) x.inv <<- inverse
  getinv <- function() x.inv
 list(set=set, get=get, setinv=setinv, getinv=getinv)
}


## Write a short comment describing this function
# Once given a matrix with the "properties" given by makeCacheMatrix,
# it calculates the inverse of the matrix or just returns it is already calculated.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
# First it is checked whether the inverse is already calculated.
 x.inv <- x$getinv()
  if (!is.null(x.inv))
  {
    message("getting cached data")
    return(x.inv)
   }
  mat <- x$get()
  x.inv <- solve(mat, ...)
  x$setinv(x.inv)
  x.inv
}
