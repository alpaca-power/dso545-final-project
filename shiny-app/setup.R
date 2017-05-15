library(dplyr)


df <- read.csv('LAKPI.csv')

names(df) <- gsub('X._', 'num_', names(df))
names(df) <- gsub('num_Unemployment', 'perc_Unemployment', names(df))
df <- lapply(df, gsub, pattern = '%', replacement = '', fixed = T)
df <- lapply(df, gsub, pattern = '$', replacement = '', fixed = T)
df <- lapply(df, gsub, pattern = ',', replacement = '', fixed = T)
df <- as.data.frame(df)
to_n <- 2:57 #ncol(df) is 57, need to convert columns to numeric for graphing
df[, to_n] <- apply(df[,to_n], 2, function(x) as.numeric(x))

categs <- names(df)
categs <- categs[4:57]
categs <- as.factor(categs)

