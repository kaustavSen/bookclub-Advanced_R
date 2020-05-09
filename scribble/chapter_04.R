library(magrittr)

outer(1:3, 5:7)

vals <- outer(1:5, 1:5, FUN = "paste", sep = ",")

vals[c(4, 14)]

select <- matrix(ncol = 2, byrow = TRUE, c(
  1, 3,
  3, 5,
  5, 4
))

vals[select]

df <- data.frame(x = 1:3, y = 3:1, z = letters[1:3])

df[df$x == 2, ]
df[c(1,3)]
df[c(1,3),]

df[, "x", drop = FALSE]
str(df[1, ])

x <- matrix(1:4, nrow = 2)
str(x[1, ])
str(x[1, , drop = FALSE])
dim(x[1, , drop = FALSE])
length(x[1, ])
nrow(x)

# Exercise 4.2.6

# 1. Fixing the errors

# Error
mtcars[mtcars$cyl = 4, ]

# Fixed
mtcars[mtcars$cyl == 4, ]

# Error
mtcars[-1:4, ]

# Fixed
mtcars[-(1:4), ]

# Error
mtcars[mtcars$cyl <= 5]

# Fixed
mtcars[mtcars$cyl <= 5, ]

# Error
mtcars[mtcars$cyl == 4 | 6, ]

# Fixed
mtcars[mtcars$cyl %in% c(4, 6), ]

# 2. Using NA when subsetting
x <- 1:5
x[NA]

x[NA_real_]

typeof(NA)
typeof(NA_character_)

x <- outer(1:5, 1:5)

upper.tri(x) * x

diag(x)

.row(dim(x)) == .col(dim(x))

get_diag_elements <- function(x) {
  indices <- .row(dim(x)) == .col(dim(x))
  x[indices]
}

get_diag_elements(x)

cbind(seq_len(5), seq_len(5))


