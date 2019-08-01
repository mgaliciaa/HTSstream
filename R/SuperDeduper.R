hts_SuperDeduper <- setClass("hts_SuperDeduper",
                             slots = list(ignored = "integer",
                                          duplicate = "integer",
                                          duplicate_saturation = "list"),
                             contains = "hts_Base")

hts_SuperDeduper <- function(SuperDeduper.data = list()){
  expected <- c("Notes", "totalFragmentsInput", "totalFragmentsOutput", "ignored", "duplicate",
                "duplicate_saturation", "SE_in", "SE_out", "PE_in", "PE_out")
  if (!all(names(expected) == expected)) {
    stop("error with message")}

  my_class_ss <- new("hts_SuperDeduper", Notes = SuperDeduper.data$Notes,
                     totalFragmentsInput = SuperDeduper.data$totalFragmentsInput,
                     totalFragmentsOutput = SuperDeduper.data$totalFragmentsOutput,
                     ignored = SuperDeduper.data$ignored,
                     duplicate = SuperDeduper.data$duplicate,
                     duplicate_saturation = SuperDeduper.data$duplicate_saturation,
                     SE_in = SuperDeduper.data$Single_end$SE_in,
                     SE_out = SuperDeduper.data$Single_end$SE_out,
                     PE_in = SuperDeduper.data$Paired_end$PE_in,
                     PE_out = SuperDeduper.data$Paired_end$PE_out)
  return(my_class_ss)

  setValidity("hts_SuperDeduper", validSuperDeduper)
  validSuperDeduper(my_class_ss)

}
