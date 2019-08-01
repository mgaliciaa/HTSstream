hts_Stats <- setClass("hts_Stats",
                      slots = list(SE_readlength_histogram = "list",
                                   R1_readlength_histogram = "list",
                                   R2_readlength_histogram = "list",
                                   Base_composition = "integer",
                                   A = "numeric",
                                   C = "numeric",
                                   G = "numeric",
                                   T = "numeric",
                                   N = "numeric",
                                   SE_bpLen = "numeric",
                                   SE_bQ30 = "numeric",
                                   R1_bpLen = "numeric",
                                   R1_bQ30 = "numeric",
                                   R2_bpLen = "numeric",
                                   R2_bQ30 = "numeric"),
                      contains = "hts_Base")

hts_Stats <- function(Stats.data = list()){
  expected <- c("Notes", "totalFragmentsInput", "totalFragmentsOutput", "SE_readlength_histogram", "R1_readlength_histogram",
                "R2_readlength_histogram", "A", "C", "G", "T", "N", "SE_in", "SE_out", "SE_bpLen", "SE_bQ30",
                "PE_in", "PE_out", "R1_bpLen", "R1_bQ30", "R2_bpLen", "R2_bQ30")
  if (!all(names(expected) == expected)) {
    stop("error with message")}

  my_class_ss <- new(Class = "hts_Stats", Notes = Stats.data$Notes,
                     totalFragmentsInput = Stats.data$totalFragmentsInput,
                     totalFragmentsOutput = Stats.data$totalFragmentsOutput,
                     R1_readlength_histogram = Stats.data$R1_readlength_histogram,
                     R2_readlength_histogram = Stats.data$R2_readlength_histogram,
                     A = Stats.data$Base_composition$A,
                     C = Stats.data$Base_composition$C,
                     G = Stats.data$Base_composition$G,
                     T = Stats.data$Base_composition$T,
                     N = Stats.data$Base_composition$N,
                     SE_in = Stats.data$Single_end$SE_in,
                     SE_out = Stats.data$Single_end$SE_out,
                     SE_bpLen = Stats.data$Single_end$SE_bpLen,
                     SE_bQ30 = Stats.data$Single_end$SE_bQ30,
                     PE_in = Stats.data$Paired_end$PE_in,
                     PE_out = Stats.data$Paired_end$PE_out,
                     R1_bpLen = Stats.data$Paired_end$R1_bpLen,
                     R1_bQ30 = Stats.data$Paired_end$R1_bQ30,
                     R2_bpLen = Stats.data$Paired_end$R2_bpLen,
                     R2_bQ30 = Stats.data$Paired_end$R2_bQ30)
  return(my_class_ss)

  setValidity("hts_Stats", validStats)
  validStats(my_class_ss)

}
