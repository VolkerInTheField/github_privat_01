dependencies <- c("tidyr", "dplyr", "data.table", "xlsx", "lubridate", "stringr",
                  "dbplyr", "stringi", "dbx", "DBI", "vctrs", "fs", "gdata",
                  "ggplot2", "plotly", "readxl")

lapply(dependencies, require, character.only = TRUE)

data <- fread("C:/R_Tools/Vertriebsreport_R/output/ds_rk_gmbh_gesamt.txt")

pab <- data$ProduktAnbieterId
summary(pab)

str(data)

int_mat <- matrix(1:12,3)
int_mat
class(int_mat)

a_numeric_array = array(rweibull(24, shape = 1, scale = 1), dim = c(2, 3, 4))
a_numeric_array

an_integer_array = array(rbinom(24, size = 8, prob = 0.5), dim = c(2, 3, 4))
an_integer_array

class(int_mat)
class(int_mat) <- "my_class"
