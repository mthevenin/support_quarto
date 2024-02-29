library(gtsummary)

# summarize the data with our package
table1 <-  trial %>% tbl_summary(include = c(age, grade, response))
table1


