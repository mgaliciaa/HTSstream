hts_AdapterTrimmer <- setClass("hts_AdapterTrimmer",
                               slots = list(fixbases = "integer",
                                            SE_discarded = "integer",
                                            SE_adapterTrim = "integer",
                                            SE_adapterBpTrim = "integer",
                                            R1_discarded = "integer",
                                            R2_discarded = "integer",
                                            PE_discarded = "integer",
                                            PE_adapterTrim = "integer",
                                            PE_adapterBpTrim = "integer"),
                               contains = "hts_Base")

hts_AdapterTrimmer <- function(AdapterTrimmer.data = list()){
  expected <- c("Notes", "totalFragmentsInput", "totalFragmentsOutput", "R1_readlength_histogram",
                "R2_readlength_histogram", "A", "C", "G", "T", "N", "SE_in", "SE_out", "SE_bpLen", "SE_bQ30",
                "PE_in", "PE_out", "R1_bpLen", "R1_bQ30", "R2_bpLen", "R2_bQ30")
  if (!all(names(expected) == expected)) {
    stop("error with message")}

  my_class_ss <- new("hts_AdapterTrimmer", Notes = AdapterTrimmer.data$Notes,
                     totalFragmentsInput = AdapterTrimmer.data$totalFragmentsInput,
                     totalFragmentsOutput = AdapterTrimmer.data$totalFragmentsOutput,
                     fixbases = AdapterTrimmer.data$fixbases,
                     SE_in = AdapterTrimmer.data$Single_end$SE_in,
                     SE_out = AdapterTrimmer.data$Single_end$SE_out,
                     SE_discarded = AdapterTrimmer.data$Single_end$SE_discarded,
                     SE_adapterTrim = AdapterTrimmer.data$Single_end$SE_adapterTrim,
                     SE_adapterBpTrim = AdapterTrimmer.data$Single_end$SE_adapterBpTrim,
                     PE_in = AdapterTrimmer.data$Paired_end$PE_in,
                     PE_out = AdapterTrimmer.data$Paired_end$PE_out,
                     R1_discarded = AdapterTrimmer.data$Paired_end$R1_discarded,
                     R2_discarded = AdapterTrimmer.data$Paired_end$R2_discarded,
                     PE_discarded = AdapterTrimmer.data$Paired_end$PE_discarded,
                     PE_adapterTrim = AdapterTrimmer.data$Paired_end$PE_adapterTrim,
                     PE_adapterBpTrim = AdapterTrimmer.data$Paired_end$PE_adapterBpTrim)
  return(my_class_ss)

  setValidity("hts_AdapterTrimmer", validAdapterTrimmer)
  validAdapterTrimmer(my_class_ss)

}
