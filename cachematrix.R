##take a matrix that can be inversed and cache it. Use the cached version for creating an inverse of the matrix.

#take a matrix as input and create a list of functions to be used for setting and retrieving the inverse of that matrix

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL 
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() {
    x
  }
  setInverse <- function(inverse) {
    inv <<- inverse
  }
  getInverse <- function() {
    inv
  }
  list(set = set, get = get, setInverse=setInverse, getInverse=getInverse)
}


#takes the cached matrix as an input. First step is to check whether the inverse of that matrix is stored in the function getInverse(). If it is, it is returned. I not, it is created, stored in getInverse() and returned. 
cacheSolve <- function(x, ... ) {
  #returs the inverse of 'x'.
  inv <- x$getInverse()
  if (!is.null(inv)){
    print("Getting cached matrix..")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data)
  x$setInverse(inv)
  inv
  
}
