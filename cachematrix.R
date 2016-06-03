## These two functions calculate the cached inverse of a matrix.

## This first function generates a "vector" that is actually a list.  It creates a function that: 
  ## 1. Sets the value of the matrix
  ## 2. Gets the value of the matrix
  ## 3. Sets the value of the inverse of the matrix
  ## 4. Gets the value of the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y) {
        x <<- y
        i <<- NULL
        }
    get <- function() x
    setinverse <- function(inverse) i <<- inverse
    getinverse <- function() i
    list(set = set, get = get, 
         setinverse = setinverse, 
         getinverse = getinverse)
}


## This second function calculates the inverse of a matrix. It first checks to see if the matrix inverse 
## has already been calculated. If so, it takes that calculation and doesn't do any additional compuations.  
## If the matrix inverse has not already been calculated, it computes the matrix inverse and 
## sets its value with the setinverse function.

cacheSolve <- function(x, ...) {
     i <- x$getinverse()
     if(!is.null(i)) {
        message("getting cached data")
        return(i)
        }
    data <- x$get()
    i <- solve(data, ...)
    x$setinverse(i)
    i
}

