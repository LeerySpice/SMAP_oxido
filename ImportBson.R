library(mongolite)
library(jsonlite)

# Import MongoDB
BD <- mongo(collection = as.character(Sys.Date()), db = "polin")
BD <- mongo(db = "polin")
BD$import(file("Data/polin/measurements.bson"), bson = TRUE)
BD$export(file("Data/DataOctubre.json"))

# Data.R
data <- stream_in(file("Data/DataOctubre.json"),pagesize = 10)
save(data,file="Data/dataOctubre.Rda")

# Clear
BD$drop()
BD$disconnect()
rm(BD)
file.remove("Data/DataOctubre.json")
