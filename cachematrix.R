## Folllowing Prof Peng's example for caching the value and mean of a vector: 

## The first function, makeCacheMatrix creates a list containing a function that 
## sets and gets the value of the matrix and sets and gets the value of its inverse.

makeCacheMatrix <- function(x = matrix()) {
 m <- NULL
 set <- function(y) {
   x <<- y  ## The '<<-' operator searches through parent enviornments for a symbol, and,
   m <<- NULL ## if found, updates it, otherwise it inserts a new value.
 }
 get <- function() x
 setmatrix <- function(solve) m <<- solve
 getmatrix <- function() m
 list(set = set, get = get,
      setmatrix = setmatrix,
      getmatrix = getmatrix)
}

## The list containing the functions from makeCacheMatrix can be passed to 
## cache solve, which will check to see if the matrix exists, cache it if it does not, 
## return the inverse (solution) of the matrix.

cacheSolve <- function(x, ...) {
  m <- x$getmatrix()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  matrix <- x$get()
  m <- solve(matrix, ...)
  x$setmatrix(m)
  m
}

