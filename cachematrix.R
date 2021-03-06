## This function does 4 things:
## 1. sets the value of the matrix,
## 2. gets the value of the matrix,
## 3. sets the value of the inverse,
## 4. gets the value of the inverse.

makeCacheMatrix <- function(x = matrix()) {
        
                m <- NULL
                set <- function(y) {
                        x <<- y
                        m <<- NULL
                }
                get <- function() x
                setinverse <- function(solve) m <<- solve
                getinverse <- function() m
                list(set = set, get = get,
                     setinverse = setinverse,
                     getinverse = getinverse)
}


## This functions calculates the inverse of the matrix created with the previous function.
## It first checks to see if the inverse has already been calculated.
## If so, it gets the inverse from the cache and skips the computation.
## Otherwise, it calculates the inverse of the matrix and setst eh value of the matrix in the cache.


cacheSolve <- function(x, ...) {
        
        m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
        ## Return a matrix that is the inverse of 'x'
}
