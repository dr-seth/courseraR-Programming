## Below are two functions that are used to create a special object that stores a matrix and 
## cache's its inverse.

## The first function, makeCacheMatrix creates a special "matrix", 
## which is really a list containing a function to:
## 1)set the value of the matrix (set_matrix)
## 2)get the value of the matrix (get_matrix)
## 3)set the value of the inverse (set_inverse)
## 4)get the value of the inverse (get_inverse)

makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL 					                                # assigning 'NULL' to inverse
  set_matrix <- function(y) {			
    x <<- y 					                                      # set the matrix as 'x'
    inverse <<- NULL
  }
  get_matrix <- function() x 				                        # returning matrix 'x'
  set_inverse <- function(solve) inverse <<- solve 	        # cache value of inverse 
  get_inverse <- function() inverse 			                  # return inverse
  list(set_matrix = set_matrix, get_matrix = get_matrix,
       set_inverse = set_inverse,
       get_inverse = get_inverse)
}


## The following function calculates the inverse of the special "matrix" created with the above function.
## However, it first checks to see if the inverse has already been calculated. 
## If so, it gets the inverse from the cache and skips the computation. 
## Otherwise, it calculates the inverse of the data and sets the value of the inverse in the cache via 
## the 'set_inverse' function.

cacheSolve <- function(x, ...) {				                    # Return matrix that is inverse of 'x'
  inverse <- x$get_inverse()				                        # get inverse
  if(!is.null(inverse)) {					                          # validate inverse
    message("getting cached data")			                    # dispaly message
    return(inverse)
  }
  data <- x$get_matrix()					                          # get Matrix
  inverse <- solve(data, ...)				                        # compute inverse
  x$set_inverse(inverse)					                          # cache inverse
  inverse 						                                      # return inverse
}

