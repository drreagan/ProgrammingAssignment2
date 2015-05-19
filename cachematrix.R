## Set of functions to facilitate matrix inversion to reduce costly computation
## involved with calculating inverse of the matrix 

## Function: makeCacheMatrix
## Arguments: x - a matrix (default: empty matrix)
## Returns: A list containing a set of functions which perform operations on the
##          matrix as follows:
##		set: function to set the contents of vector	
##		get: function to return the vector
## 		setInverse: function that caches the inverse of the matrix
##		getInverse: function that returns a cached value of the matrix; NA if
##			 not set.

makeCacheMatrix <- function(x = matrix()) {
	myInverse <- NULL
	set <- function(aMatrix) {
		x <<- aMatirx
		myInverse <<- NULL
	}
	get <- function() x
	setInverse <-  function(anInverse) myInverse <<- anInverse
	getInverse <- function() myInverse
	list( set = set, get = get, setInverse = setInverse, getInverse = getInverse )
}


## Function: cacheSolve
## Arguments: x: a matrix created by makeCacheMatrix function.
## Returns: A matrix containing the inverse (Either from x's cached inverse,
##          or a freshly calculated one if none already exists.   If it must
##          calculate a new inverse, it will also save that with x's setInverse
##          function for later retrieval)

cacheSolve <- function(x, ...) {
    # Check if x already has a cached inverse
    myInverse <- x$getInverse()
    if(!is.null(myInverse)) {
        # It does have a cache, so return that
        message("Getting cached inverse Matrix")
        return(myInverse)
    }
    # No cached inverse, so get the matrix, and solve an inverse for it
    myMatrix <- x$get()
    myInverse <- solve(myMatrix)
    # Save the inverse to the cache
    x$setInverse(myInverse)
    # Return the inverse
    myInverse
}
