# Matrix
#Following function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x=numeric()){

        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setInverse <- function(solve) m <<- solve
        getInverse <- function() m
        list(set = set, get = get,
             setInverse = setInverse,
             getInverse = getInverse)

}
#Execution
#x <- c(7:10)
#x <- matrix(x,2,2)
#y <- makeCacheMatrix(x) 
#y

#--------------------------------------------------------------------------------------------------------


#cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        m <- x$getInverse()
        if(!is.null(m)) {
                message("getting cached data")
		    print(m)
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setInverse(m)
        m
}


#Execution
#inv_mat <- cacheSolve(y)
