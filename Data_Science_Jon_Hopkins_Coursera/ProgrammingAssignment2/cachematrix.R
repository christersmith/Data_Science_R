## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
# Matrix inversion is usually a costly computation and there may be some benefit
# to caching the inverse of a matrix rather than compute it repeatedly. The
# following two functions are used to cache the inverse of a matrix.

# makeCacheMatrix creates a list containing a function to
# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the value of inverse of the matrix
# 4. get the value of inverse of the matrix
makeCacheMatrix <- function(x = matrix()) {
  v <- NULL
  set <- function(y) {
    x <<- y
    v <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) v <<- inverse
  getinverse <- function() v
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


# The following function returns the inverse of the matrix. It first checks if
# the inverse has already been computed. If so, it gets the result and skips the
# computation. If not, it computes the inverse, sets the value in the cache via
# setinverse function.

# This function assumes that the matrix is always invertible.
cacheSolve <- function(x, ...) {
  v <- x$getinverse()
  if(!is.null(v)) {
    message("getting cached data.")
    return(v)
  }
  data <- x$get()
  v <- solve(data)
  x$setinverse(v)
  v
}

##Sample run:
x = rbind(c(1/2, -1), c(-1/3, 1))
m = makeCacheMatrix(x)
m$get()
##           [,1] [,2]
##[1,]  0.5000000   -1
##[2,] -0.3333333    1

## No cache in the first run
cacheSolve(m)
##      [,1] [,2]
## [1,]    6    6
## [2,]    2    3

## Retrieving from the cache in the second run
cacheSolve(m)
## getting cached data.
##      [,1] [,2]
## [1,]    6    6
## [2,]    2    3