library(tibble)

df1 <- data.frame(x = 1:3, y = letters[1:3])

typeof(df1)
attributes(df1)

rownames(df1)

df2 <- tibble(
  x = 1:3,
  y = letters[1:3]
)

df2
typeof(df2)
attributes(df2)

df1 <- data.frame(
  x = 1:3,
  y = c("a", "b", "c"),
  stringsAsFactors = FALSE
)

str(df1)

df2 <- tibble(
  x = 1:3,
  y = c("a", "b", "c")
)

str(df2)

names(data.frame(`1` = 1))
names(tibble(`1` = 1))

tibble(
  x = 1:3,
  y = x * 2  # Ok. No error here.
)

data.frame(  
  x = 1:3,
  y = x * 2  # this will give an error
)

df3 <- data.frame(
  age = c(35, 27, 18),
  hair = c("brown", "black", "blonde"),
  row.names = c("Bob", "Susan", "Sam")
)

row.names(df3)
df3["Bob", ]

df3[c(1, 1, 1), ]

as_tibble(df3, rownames = "name")

df1 <- data.frame(xyz = "a")
df2 <- tibble(xyz = "a")

str(df1$x)
str(df2$x)

data.frame(
  x = 1:3,
  y = list(1:3, 2:4, 3:5)
)

dfm <- data.frame(
  x = 1:3 * 10
)

dfm
dfm$y <- matrix(1:9, nrow = 3)
dfm$z <- data.frame(a = 1:3, b = letters[1:3], stringsAsFactors = FALSE)

str(dfm)

as_tibble(dfm)

df <- data.frame(
  a = rep(c("apple", "banana"), 5),
  b = 1:10 * runif(10)
)

rownames(df) <- rep(1, 10)

t(df)
t(t(df))

data.matrix(df)

df_coltypes <- data.frame(
  a = c("a", "b"),
  b = c(TRUE, FALSE),
  c = c(1L, 0L),
  d = c(1.5, 2),
  e = c("one" = 1, "two" = 2),
  g = factor(c("f1", "f2")),
  stringsAsFactors = FALSE
)

data.matrix(df_coltypes)

x <- NULL

length(x)
attributes(x)
attr(x, "my_attribute") <- 123

x <- list(a = 1:2, b = c("apple", "orange", "banana"))

str(x)

dim(x) <- c(1, 2)

x

