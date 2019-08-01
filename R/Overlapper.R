hts_Overlapper <- setClass("hts_Overlapper",
                           slots = list(Notes = "character",
                                        totalFragmentsInput = "integer",
                                        totalFragmentsOutput = "integer",
                                        SE_in = "integer",
                                        SE_out = "integer",
                                        PE_in = "integer",
                                        PE_out = "integer",
                                        sins = "integer",
                                        mins = "integer",
                                        lins = "integer",
                                        adapterTrim = "integer",
                                        adapterBpTrim = "integer",
                                        readlength_histogram = "list",
                                        SE_discarded = "integer"),
                           contains = c("hts_discarded"))

hts_Overlapper <- function(Overlapper.data = list()){
  expected <- c("Notes", "totalFragmentsInput", "totalFragmentsOutput", "sins", "mins", "lins", "adapterTrim",
                "adapterBpTrim", "SE_in", "SE_out", "SE_discarded", "PE_in", "PE_out",
                "R1_discarded", "R2_discarded", "PE_discarded", "readlength_histogram")
  if (!all(names(expected) == expected)) {
    stop("error with message")}

  my_class_ss <- new("hts_Overlapper", Notes = Overlapper.data$Notes,
                     totalFragmentsInput = Overlapper.data$totalFragmentsInput,
                     totalFragmentsOutput = Overlapper.data$totalFragmentsOutput,
                     sins = Overlapper.data$sins,
                     mins = Overlapper.data$mins,
                     lins = Overlapper.data$lins,
                     adapterTrim = Overlapper.data$adapterTrim,
                     adapterBpTrim = Overlapper.data$adapterBpTrim,
                     readlength_histogram = Overlapper.data$readlength_histogram,
                     SE_in = Overlapper.data$Single_end$SE_in,
                     SE_out = Overlapper.data$Single_end$SE_out,
                     SE_discarded = Overlapper.data$Single_end$SE_discarded,
                     PE_in = Overlapper.data$Paired_end$PE_in,
                     PE_out = Overlapper.data$Paired_end$PE_out,
                     R1_discarded = Overlapper.data$Paired_end$R1_discarded,
                     R2_discarded = Overlapper.data$Paired_end$R2_discarded,
                     PE_discarded = Overlapper.data$Paired_end$PE_discarded)
  return(my_class_ss)

  setValidity("hts_Overlapper", validOverlapper)
  validOverlapper(my_class_ss)

}
