# R INTRO
# Topics adapted from https://discdown.org/rprogramming/
# Reto Stauffer, Joanna Chimiak-Opoka, Thorsten Simon, Achim Zeileis





#Everything in R is an object. 
# objects can be:

  # Variables x, ciao
  # Functions sum(), var(), abs()




# create object x and fill it with value 3
  x <- 3
  x = 3
  
# <-  (and =) evaluates the the expression on its right side and assign the evaluated value to the symbol (variable) on the left side (x)
# in the current environment.
  
# x gets a numeric vector of length 1  
  
  x <- 3 + 5
  
  x <- x + x
  
  x 
  

  
  
############# Printing ###########  
  

#Print objects
  
  # Implicit printing
  x
  # Explicit printing
  print(x)

#(i) create new objects and (ii) directly print them 
a <- 5^2
a
## or more briefly 
( a <- 5^2 )




################  VECTORS ##########################
# Vectors are the basis for all complex objects such as data frames  


# Can  be distinguished by  
# dimensionality (1-d, 2-d, n-d) 
# homogenous vs. heterogenous .

rbind(c("Dimension", "Homogenous", "Heterogenous"),
      c("1",	"Atomic vectors", "Lists"),
      c("2",	"Matrix",	"Data frame"),
      c("≥ 1","Array",NA)
)


#Vector ->  sequence of elements of a certain type(s)

# Atomic vectors: All elements must have the same basic type (e.g., numeric, character).
# Lists: Special type of a vector. 
# Different elements can have different types.

# Six different atomic vectors exist to store data of different types.

    # 1	double (or numeric)	-0.5, 120.9, 5.0	Floating point numbers with double precision
    
    # 2	integer	-1L, 121L, 5L	"Long" integers
    
    # 3	logical	TRUE, FALSE	Boolean
    
    # 4	character	"This is a string", "5" or 'R', '5'	Text
    
    # 5	complex	-5+11i, 3+2i, 0+4i	Real+imaginary numbers
    
    # 6	raw	01, ff	Raw bytes (as hexadecimal)



#Important vector functions



# c(): Combines multiple elements into one atomic vector.

# length(): Returns the length (number of elements) of an object.

# class(): Returns the class of an object.    What kind of object is it (high-level)? 

# typeof(): Returns the type of an object.    What is the object's data type (low-level)?

# attributes(): Returns further metadata of arbitrary type.

x <- 1.5

length(x)      # Length of the vector.
class(x)       # What is the class of the object?
typeof(x)      # What is the type of this vector?


x=1e23

class(x)               # Checking class
typeof(x)              # Checking the type


x <- c(111L, 555L)     # Create the vector; overwrite 'x'
length(x)              # Checking length
class(x)               # Checking class
typeof(x)              # Checking the type


#character
y <- c("this is", "just some text")
length(y)
class(y)
typeof(y)

#  Double
x <- 1.5
class(x)

(x <- 10)
class(x)
typeof(x)


#  Integer

(x <- 10L)
class(x)
typeof(x)

#  Logical
(x <- TRUE)
(x <- FALSE)
class(x)
typeof(x)

#  Character

(x <- "Austria")
(x <- "Max Konstantin Mustermann (AT)")
class(x)


# Checking class or type
  # is.double()
  # is.numeric()
  # is.integer()
  # is.logical()
  # is.character()
  # is.vector()
  # .....

is.integer(1.5)
is.double(1.5)

is.double('1.5')

is.character("Bruno")
is.character('ciao_ciao')
ciao_ciao <- 3
is.character(ciao_ciao)

is.vector(c(1, 2, 3, 4))


# Missing values
# R knows two types of missing values: NaN and NA. 
# NaN is "not a number" and results from mathematical operations which are illegal/invalid. 
# NA on the other hand stands for ‘not available’ and indicates a missing value. 

#  NaN: Mathematically not defined (and always of class numeric).
#  NA: Missing value, NA’s still have classes!

(x <- 0 / 0)

is.nan(x)    # Check if 'x' is NaN
is.na(x)     # Check if 'x' is NA

# Missing values in R still have a class. We can have missing numeric, integer, logical, or character missing values. 
# They all look the same, but have a class attached to it.

class(x)  # The value from above

# By default - logical
(x <- NA)
class(x)

# Convert to integer
(y <- as.integer(NA))
class(y)

y <- as.numeric(y)
class(y)


# Convert to character
(z <- as.character(NA))
class(z)

#Same NA different type!



####### Creating vectors ##########

# Concatenating values c()

x <- c(1.5, 1000L, 0.1)

# data of one type! 


(y <- c("Austria", "Tyrol", "Innsbruck"))

#c() can also be seen (and used) to combine vectors just the same way as used for elements.

x <- c("Austria", "Tyrol", "Innsbruck")
y <- c("Germany", "Berlin", "Berlin")
z <- c(x, y, x ,y, "ciao",NA)
z

length(z)

x <- c(0.5, 0.6, 0.7)            # double
x <- c(TRUE, FALSE, TRUE)        # logical
x <- c("a", "b", "c")            # character
x <- c(1L, 2L, 3L, 4L)           # integer
x <- 15:20                       # integer

x <- c(1+0i, 2+4i, 5+2i)         # complex




#Function vector() produces a vector of the given length and mode

# Double (numeric) vector of length 5
vector("double", length = 5)

# Character vector of length 3
vector("character", length = 3)
vector("logical", length = 3)


#Numeric sequences

#Regular sequences 
  # seq()
  # seq.int() 
  # seq_along() 
  # and seq_len()

# To create a sequence, we have to at least specify three input arguments:
#   
# from: Where to start the sequence.
# to: Where to end the sequence.
# length or by: either define the length of the resulting vector, or the increment by which the values change. 
# Note: if from is smaller than to, by must be negative (decreasing sequence). Else you’ll get an error.

# Equidistant numeric sequence
seq(from = 1.5, to = 2.5, length = 5)  # Specify length
seq(from = 4, to = -4, by = -1)      # Specify increment/interval

# Explicitly define from/to/by as integers
  (x <- seq(from = 10L, to = 100L, by = 10L))
  class(x)

  # 'from' defined as a numeric value (10.0)
(y <- seq(from = 10, to = 100L, by = 10L))
class(y)


#Integer sequences: There are three distinct functions to create proper integer sequences.

# <from>:<to>   Two values separated by a colon (:); creates sequences in steps of +1 or -1. 
# seq_along(x): Creates a sequence from 1L to length(x) where x is an existing object (e.g., a vector).
# seq_len(n): creates a sequence between 1L and n.

# Sequence from 1:4
(x <- 1:4)
class(x)

# Sequence from 30:25 (decreasing)
(y <- 30:25)
class(y)

#To be able to use seq_along() we need an object along which we would like to create the integer sequence. 

# Create character vector 'cities'
cities <- c("Vienna", "Paris", "Berlin", "Rome", "Bern")
seq_along(cities)

# seq_len() simply creates an integer sequence from 1L to n:
  
  seq_len(10)

#Character Sequences: 
  # R provides   two  vectors which are available globally called LETTERS and letters. 
  # LETTERS contains the alphabet (no special characters) in upper case letters ("A", "B", …), 
  # letters the same in lower case letters ("a", "b", …). 

# First 7 letters of the alphabet
LETTERS[1:7]
letters[1:7]

letters[7:1]


#Replicating elements

rep(2L, 5)                # Case (1)

cities <- c("Vienna", "Bern", "Rome")
rep(cities, each = 3)     # Case (2)

rep(cities, times = c(3))    # Case (3)

rep(cities, times = c(3, 2, 5))

rep(cities, times = c(3, 2))

################## Coercion  ###################

#Vectors can only contain elements of one type! 
# ‘coercion’. 
      # implicit coercion (R chooses the best option)  
      # explicit coercion ( force something to be of a different type).

#Numeric and character
  # Numeric and character = character
  (x <- c(1.7, "1", "A"))
  class(x)

# What is x (character vector) times 5.0 (numeric)?
x * 5.0 

#Numeric and logical

  # Every numeric value equal to 0/0L converted to logical results in FALSE.
  # Every numeric value not equal to 0/0L converted to logical results in TRUE.
  # Every TRUE converted to numeric will be 1 (or 1L).
  # Every FALSE converted to numeric will be 0 (or 0L).

  # Combine TRUE, 5.5, and 10.0.
  (x <- c(FALSE, 5.5, 10.0))
  class(x)

# Explicit coercion

as.integer()
as.numeric()
as.character()
as.logical()
as.matrix()

  # let `x` be an integer vector
  # with elements 0, 1, 2, 3, 4.
  (x <- 0:4)

# Coerce to character
as.character(x)

# Coerce to logical
as.logical(x)

  # let `x` be a character vector
  (x <- c("a", "b", "c", "d"))

# Coerce to integer
as.integer(x)

# But ...
x <- c("1", "100", "a", "b", "33")
as.integer(x)

#Coercion summary

library(tidyverse)
table <- tribble(~"x",~"as.numeric",~"as.integer", ~"as.logical"	, ~"as.character",
"2.9","2.9","2L","TRUE","'2.9'",
"0","0","0L","FALSE","'0'",
"4L","4","4L","TRUE","'4'",
"0L","0","0L","FALSE","'0'",
"TRUE","1","1L","TRUE","'TRUE'",
"FALSE","0","0L","FALSE","'FALSE'",
"'A'","NA","NA","NA","'A'",
"'TRUE'","NA","NA","TRUE","'TRUE'",
"'FALSE'","NA","NA","FALSE","'FALSE'",
"NA","NA","NA","NA","'NA'")

View(table)

################ Mathematical operations ################ 
#Once we have a vector (even vectors of length 1; single value) we can perform arithmetic operations on them. 

?Arithmetic
  
  #   operator	description	example
  # +	addition	5 + 5 = 10
  # -	subtraction	5 - 5 = 0
  # *	multiplication	2 * 8 = 16
  # /	division	100 / 10 = 10
  # ^ (or **)	exponent/power	5^2 = 25
  # %%	modulo	100 %% 15 = 10
  # %/%	integer division	100 %/% 15 = 6
  

###########  relational and logical operators ###########  
?Comparison 
?Logic

# Type	Operator	Condition
# Relational	x < y	Where x smaller than y
#             x > y	Where x larger than y
#             x <= y	Where x smaller or equal to y
#             x >= y	Where x larger or equal to y
#             x == y	Where x (exactly) equals y
#             x != x	Where x is not equal to y

# Logical	
#         !	Negation (NOT; !x == 20, same as x != 20)
#         &	Logical "and" (x >= 20 & x < 35)
#         |	Logical "or" (x == 20 | x > 45)
#         xor	Logical "exclusive or" (xor(x == 20, x == 50))

# Value matching	x %in% y	Where x is in y (value matching; character)
#                 ! x %in% y	Where x is not in y (value matching; character)

x <- c(30L, 100L, 120L, 10L, -30L, 50L)
x == 100L            # Which element in 'x' is equal to 100L
x <= 30L             # Which element in 'x' is smaller or equal to 30L

x <= 30L | x == 100L

#########   Vectors and scalars ###########  
# We can use all the arithmetics on numeric vectors. 

  # Multiply a sequence by 2
  (x <- 1:10)
  x * 2
  
  x + 3
  

  # Our vector x
  ( x <- c(43, 100, 34, 483, 1000) )
  x %% 10


# Vectors and Vectors (Matching Length) 

# Our data
x <- c(500, 400, 600)
y <- c(10, 5, 100)
# Call x + y (addition) and x / y (division)
x + y

x / y

# Vectors and vectors (non-matching lengths)

# Our data
x <- c(500, 400, 600, 800)
y <- c(100, 2)
# Call x + y (addition) and x / y (division)
x + y
x / y

# R recycles the shorter vector! 
# Internally, R expands the vector y to c(100, 2, 100, 2). Thus,

# in case of x + y the result is x + c(100, 2, 100, 2)
# in case of x / y the result is x / c(100, 2, 100, 2)

# Logical values
# Arithmetic operations can also be performed on logical elements. 
# As we have just learned TRUE will always be converted to 1L, FALSE always to 0L. 

c(TRUE, FALSE) * 100L

c(TRUE, FALSE) / 2


# Missing values
 # arithmetic operations on missing values 
 # All operations involving a missing value (NA) will always result in a missing value.

c(1, 2, NA, NA) * 100
c(1, 2, 3, 4) * c(NA)
100 %% NA

# Vector attributes
  # All objects in R can have additional so called attributes. 
  # Attributes are used to store additional meta-information. 
  # They are not part of the data itself, but part of the object

# examples of attributes are:
  
  # The class of the object.
  # The dimension of matrices or arrays.
  # Names of elements (vectors) or dimensions (matrices, arrays).


# To see if an object has such attributes we can use the function attributes() 

# Plain vector
(x <- c(54, 1.82))
attributes(x)

### Named vectors
# One additional attributes are names. 
# Names can be used to name individual elements of a vector. 

# Adding optional names
(y <- c(age = 54, height = 1.82))

##    age height 
attributes(y)

# Technically, names are one of the ‘standard’ attributes of every object
# a special function called names() 

# To get the names of an object.
# To set or overwrite the names of an object.

# Named vectors are self-explanatory
# We can access specific elements by name

  # Create a named vector
  (x <- c(age = 54, height = 1.82))

  # Get/extract the names
  names(x)

    
  # set names with names()
  (x <- c(1L, 2L, 3L)) # Plain vector (without names)
  names(x)
  names(x) <- c("first", "second", "third")
  names(x)
  x

# Change the names of 'x'
names(x) <- c("1th", "2nd", "3th")
x



########################## Subsetting vectors  ########################## 
# Accessing specific elements of a vector (or an object in general) is called subsetting. 
# Vectors can be subsetted in different ways:
  
  # By index (position in the vector).
  # Based on logical vectors.
  # By name (if set).

#Subsetting by index
#Subsetting uses squared brackets ([...] or [[...]]).


# An index is simply the position of a specific element in a vector. 
# R always starts counting at 1 
# first element by calling x[1] 

# Create a demo vector of length 5
(x <- c(10, 20, 0, 30, 50))
x[1]          # Extract first element by index
x[5]          # Fifth element

# multiple elements at the same time, use a vector:
  
  x[c(1, 5)]   # Get the first and fifth
  x[c(3,5,1)]   # Or the fifth and first (different order)

# negative indexes to get all values except some specific ones. 
  # E.g., x[-1] gives "all but the first element of x".

x[-1L]          # all but first
x[-5L]          # all but fifth
x[-c(1L, 5L)]   # all except first and fifth

#Out-of-range indexes
  
x[1:7]
x[100]

# Last/first few elements
x[1:4]          # First four elements (element 1 - 4)
x[7:10]         # Last four elements (elements 7 - 10)
x[3:5]        


head(x, n = 6) # extracts the first n elements (by default n = 6).
tail(x, n = 6) # extracts the last n elements (by default n = 6).
head(x, n = 4)
tail(x, n = 4)

####  Subsetting by name

  x <- c(age = 35, height = 1.72, zipcode = 6020)

  x["age"]
## age 
##  35
# Note: The argument inside the brackets has to be a character string. 
  # x[age] does something different - in this case R expects that there is an object called age. 
  x[age]

x[c("age", "zipcode")]  # get both, "age" and "zipcode"
##     age zipcode 
x[-"age"]               # Does not work, results in an error

## Error in -"age": invalid argument to unary operator

# Create the two named vectors
person1 <- c(age = 49, height = 1.84, zipcode = 5001)
person2 <- c(zipcode = 5040, age = 13, height = 1.52)

cat("Person 1 is ", person1[1L], "years old.\n")
cat("Person 2 is ", person2[1L], "years old.\n")

#You can see the problem. 

cat("Person 1 is ", person1["age"], "years old.\n")
## Person 1 is  49 years old.
cat("Person 2 is ", person2["age"], "years old.\n")
## Person 2 is  13 years old.


####  Subsetting by logical

x <- c(30, 10, 20, 0, 30, 50)
x[c(TRUE, TRUE, FALSE, FALSE, FALSE, FALSE)]

x > 25          # Shows the result of the relational comparison
x[x > 25]       # Use 'x > 25' (logical vector) for subsetting

x <- c(30, 10, 20, 0, 30, 50)
  
x[x == 30]            # Elements in x where x is (exactely) equal to 30
x[x == 30 | x == 50] #  Elements where x is either equal to 30 OR equal to 50.
x[x == 30 & x == 50]   #Elements wherex` is equal to 30 AND 50 at the same time. The result should be an empty vector as this is not possible.
x[x >= 30 & x < 40]    #All elements where x is larger or equal to 30, but smaller than 40.
x[x < 30 & x > 40]    #All elements where x is smaller than 30 AND larger than 40 at the same time. Again, impossible, the result should be an empty vector.

age    <- c(25,     53,    21,  50,   18,   63)
height <- c(1.73, 1.69, 1.83, 1.57, 1.91, 1.75)

res <- height < 1.8
res
age[res]

age[height < 1.8]

age[age > 50 & height < 1.8]



########### Further functions
#Beside the relational and logical operators shown above, some more exist.

# &&, ||: Like & (and) and | (or) but evaluate only first elements until results determined.
# isTRUE(), isFALSE(): Test for single non-missing TRUE or FALSE.

# Index of TRUE elements



x <- c(30, 10, 20, 0, 30, 50)
x >= 30
## [1]  TRUE FALSE FALSE FALSE  TRUE  TRUE

# which function

a <- (x >= 30)

t <- which(a)

# Example: Find the position of the minimum and the maximum of the vector x.

min(x)                # The minimum
x == min(x)           # Comparison
which(x == min(x))    # Index/position

max(x)                # The maximum
x == max(x)           # Comparison
which(x == max(x))    # Index/position


# In addition, there are two functions which.min() and which.max() 
# which are more reliable to find the minimum/maximum of floating point numbers. 
  
  z <- c(10, 0.5, 20, 30, 0.5)
which(z == min(z))     # Position/index of all minima
which.min(z)           # Position/index of first occurrence of minimum

###  Single and double brackets

# [] keeps the name attribute 
# [[]] drops them all. 
  
  (x <- c(54, 1.82, 6020))
x[3]       # Single brackets
x[[3]]     # Double brackets

#  named vector 
  
  (x <- c("age" = 54, "height" = 1.82, "zipcode" = 6020))
x[2:3]
x[3]
x[[3]]

################## Vector functions

  # Function	Description
  # round()	Round numeric values
  # min(), max()	Minimum and maximum
  # mean(), median()	Arithmetic mean and median
  # sum()	Sum
  # sd(), var()	Standard deviation and variance
  # sqrt()	Square root
  # summary()	Numerical summary
  # str()	Overview of the object structure
  # any(), all()	Test logical vector elements
  # all.equal()	Test for near equality
  


  # sort()	Sort a vector
  # order()	Obtain ordering of a vector

# pseudo-random numbers from a standard normal distribution 
# function rnorm().

x <- rnorm(1000,180,20)    # Draw 100 random numbers from the standard normal distribution
head(x, n = 10)    # Show first 10 elements

head(round(x, digits = 1), n = 10)   # Round, show first 10 elements only


# minimum, maximum, arithmetic mean, median, variance, standard deviation, 
# the sum over all and the number of elements
  
  c(min  = min(x),     max    = max(x),
    mean = mean(x),    median = median(x),
    var  = var(x),     sd     = sd(x),
    sum  = sum(x),     length = length(x))

# str() and summary(). T
# very helpful to get a first impression of the structure of an R object (str()) and its data (summary()).

str(x)      # Structure
str(x)      #tells us that our object x is a numeric (num) vector with elements  

summary(x) # Numerical summary

# Generate the vector (again).
set.seed(6020)
x <- rnorm(100)
# Replace element 2, 4, 50, 70, and 99 with a missing value (NA)
x[c(2, 4, 50, 70, 99)] <- NA 



x

summary(x)

# Count missing values
sum(is.na(x))

#Mathematical operations: as mentioned earlier all mathematical operations return NA 
#as soon as at least one missing value is involved in the calculation. 
  
  c(min  = min(x),     max    = max(x),
    mean = mean(x),    median = median(x),
    var  = var(x),     sd     = sd(x),
    sum  = sum(x))

  
  
###### handle missing values? 

#remove missing values
x2 <- na.omit(x)
c(length(x), length(x2))

# keep the missing values and account for them using the additional input argument na.rm = TRUE
c(mean(x, na.rm = FALSE),   # Default
  mean(x, na.rm = TRUE))    # Account for missing values


  # Minimum, maximum, mean, median, variance, and standard deviation
  c(min  = min(x, na.rm = TRUE),     max    = max(x, na.rm = TRUE),
    mean = mean(x, na.rm = TRUE),    median = median(x, na.rm = TRUE),
    var  = var(x, na.rm = TRUE),     sd     = sd(x, na.rm = TRUE),
    sum  = sum(x, na.rm = TRUE))

#  all() and any()
  
  # Are all elements TRUE?
  all(c(TRUE, TRUE, TRUE))
  all(c(0L, 0L, 0L) == 0L)
  all(c(1, 2, 3, 4) > 2)

  # Is any element TRUE?
  any(c(TRUE, FALSE, FALSE))
  any(c(0L, 0L, 0L) == 0L)
  any(c(-5, -3, -1) > 0)


x <- c(10, 40, 50, NA, NA, 30)
y <- c(10, 30, 50,  0, 60, 20)
any(is.na(x))
any(is.na(y))

##### Sorting 
sort(y)
sort(y,decreasing = TRUE)

sort(x)
sort(x,na.last = TRUE)
order(x)
order(y)
y[order(y)]
sort(y,decreasing=TRUE)
    

