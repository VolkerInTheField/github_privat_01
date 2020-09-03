dependencies <- c("tidyr", "dplyr", "data.table", "xlsx", "lubridate", "stringr",
                  "dbplyr", "stringi", "dbx", "DBI", "vctrs", "fs", "gdata",
                  "ggplot2", "plotly", "readxl")

lapply(dependencies, require, character.only = TRUE)

