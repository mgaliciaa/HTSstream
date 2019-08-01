library(jsonlite)
library(knitr)
library(readr)
library(stringr)
library(kableExtra)

htsStreamExperiment <- setClass("htsStream_experiment",
                                slots = list(file_paths = "vector",
                                             sample_name = "character")
)

#parameters --> vector of files (paths) --> named vector (if it is, assumed to be sample names),
#names of samples (optional) -->
#pull names from sample names or give sample names)
#if not named vectpr and samples not specificied, make names the file


samples <- dir(preproc_dir)
jsonList <- lapply(samples,function(sdir) {
  sfile = paste0(preproc_dir,"/",sdir,"/",sdir,"_htsStats.log")
  if (file.size(sfile) > 0)
    fromJSON(sfile)
})

/share/biocore/projects/Bennett_B_USDA/2019_May_DO_Progenitor_RNAseq/01-Cleaned

starting <- "."

filePath <- Sys.glob(file.path(file_dir, "*.log"))
for (fileName in filePath){
  if (length(grep()))
}


extractHTSStream <- function(file_paths, jsonList){
  file_paths = vector()
  if(length(file_paths) > 0){
    file_paths == jsonList
  } else{

  }
}



  if (file_paths

  hts_data_operations <- new("htsStream_logs",
                             sample = jsonList,
                             sample_name = samples)
  return(hts_data_operations)
}
