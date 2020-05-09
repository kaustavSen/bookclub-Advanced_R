library(magrittr)
library(dplyr)

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

is.na(mtcars)

x <- list(1:3, "a", 4:6)
x[1]   # smaller train
x[[1]] # contents of a carriage

x[-2]
x[0]
x[[c(1, 2)]]  # subsets recursively; equivalent to x[[1]][[2]]

var <- "cyl"
mtcars$var

mtcars[[var]]

x <- list(abc = 1)
x$a

x[["a"]]

y <- 1:10

y[[numeric()]]
y[[NA_integer_]]

x <- list(
  a = list(1, 2, 3),
  b = list(3, 4, 5)
)

str(x)

purrr::pluck(x, "b", 3, .default = NA)

# Exercise 4.3.5

# 1. Ways to extract the third value of cyl from mtcars

mtcars[[c("cyl")]][3]
mtcars$cyl[3]
purrr::pluck(mtcars, "cyl", 3)

with(mtcars, cyl[[3]])

x <- 1:10
x[2] <- NULL

df <- mtcars

lobstr::obj_size(mtcars)
lobstr::obj_size(mtcars, df)

df[[2]] <- NULL
lobstr::obj_size(mtcars, df)
lobstr::ref(mtcars, df)

mtcars[] <- lapply(mtcars, mean)
data(mtcars)

mtcars %>% 
  summarise_all(mean)

x <- c("m", "f", "u", "f", "f", "m", "m")
lookup <- c(m = "Male", f = "female", u = NA)

unname(lookup[x])

grades <- c(1, 2, 2, 3, 1)

info <- data.frame(
  grade = 3:1,
  desc = c("Excellent", "Good", "Poor"),
  fail = c(F, F, T)
)

id <- match(grades, info$grade)

info_2 <- info[id, ]

rownames(info_2) <- seq_len(nrow(info_2))

info_2

df <- data.frame(x = c(1, 2, 3, 1, 2), y = 5:1, z = letters[1:5])

df2 <- df[sample(nrow(df)), 3:1]

df2[order(df2$x), ]

df2[, order(names(df2))]

df <- data.frame(x = c(2, 4, 1), y = c(9, 11, 6), n = c(3, 5, 1))

rep(1:nrow(df), df$n)

df[rep(1:nrow(df), df$n), setdiff(names(df), "n")]


x <- sample(10)

id_true <- which(x < 4)

out <- rep(FALSE, length(x))
out[id_true] <- TRUE
out

unwhich <- function(x, n) {
  out <- rep(FALSE, n)
  out[x] <- TRUE
  out
}

x <- sample(10) < 4

identical(unwhich(which(x), 10), x)

(x1 <- 1:10 %% 2 == 0)
(y1 <- 1:10 %% 5 == 0)

xor(x1, y1)

base::setdiff((x | y), (x1 & y1))


base::setdiff(c(1, 2, 4), c(3, 2, 5))

x <- c(1, 2, 3, NA)

which(x > 1)