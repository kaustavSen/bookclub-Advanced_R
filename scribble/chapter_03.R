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




















