## Functions that can calculate and cache the inverse of a matrix.

## Function to cache the inverse of a matrix

makeCacheMatrix <- function(x = matrix()) {
  InverseMatrix <- NULL
  set <- function(y){
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) inverseMatrix <<- inverse
  getInverse <- function() inverseMatrix
  list(set = set, 
       get = get, 
       setInverse = setInverse, 
       getInverse = getInverse)
}


## Function to calculate the inverse matrix, if already cached then just get it from cache

cacheSolve <- function(x, ...) {
  inverseMatrix <- x$getInverse()
  if(!is.null(inverseMatrix)){
    message("Getting cached inverse matrix")
    return(inverseMatrix)
  }
  matrix <- x$get()
  inverseMatrix <- solve(matrix)
  x$setInverse(inverseMatrix)
  inverseMatrix
}
