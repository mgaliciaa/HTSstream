# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

library(jsonlite)
library(ggplot2)
library(knitr)
library(kableExtra)

htsStream <- setClass("htsStream_log",
                      slots = list(data = "list",
                                   routines = "character"))

createHtsStream <- function(filename){
  json.data <- read_json(filename)
  fdata <- names(json.data)
  apps <- sub("_[0-9]+$","",fdata)

  new_list <- sapply(fdata, function(x) {
    class_function <- sub("_[0-9]+$","",x);
    print(class_function);
    do.call(class_function, list(json.data[[x]])) })


  hts_data_operations <- new("htsStream_log",
                             data = new_list,
                             routines = apps)
  return(hts_data_operations)
}
