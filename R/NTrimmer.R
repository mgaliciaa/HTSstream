hts_NTrimmer <- setClass("hts_NTrimmer", contains = c("hts_Base", "hts_discarded", "hts_Trimmer"))

hts_NTrimmer <- function(NTrimmer.data = list()){
  expected <- c("Notes",
                "totalFragmentsInput",
                "totalFragmentsOutput",
                "SE_in",
                "SE_out",
                "SE_rightTrim",
                "SE_leftTrim",
                "SE_discarded",
                "PE_in",
                "PE_out",
                "R1_leftTrim",
                "R1_rightTrim",
                "R2_leftTrim",
                "R2_rightTrim",
                "R1_discarded",
                "R2_discarded",
                "PE_discarded")
  if (!all(names(expected) == expected)) {
    stop("error with message")}

  my_class_ss <- new("hts_NTrimmer",
                     Notes = NTrimmer.data$Notes,
                     totalFragmentsInput = NTrimmer.data$totalFragmentsInput,
                     totalFragmentsOutput = NTrimmer.data$totalFragmentsOutput,
                     SE_in = NTrimmer.data$Single_end$SE_in,
                     SE_out = NTrimmer.data$Single_end$SE_out,
                     SE_rightTrim = NTrimmer.data$Single_end$SE_rightTrim,
                     SE_leftTrim = NTrimmer.data$Single_end$SE_leftTrim,
                     PE_in = NTrimmer.data$Paired_end$PE_in,
                     PE_out = NTrimmer.data$Paired_end$PE_out,
                     R1_leftTrim = NTrimmer.data$Paired_end$R1_leftTrim,
                     R1_rightTrim = NTrimmer.data$Paired_end$R2_rightTrim,
                     R2_leftTrim = NTrimmer.data$Paired_end$R2_leftTrim,
                     R2_rightTrim = NTrimmer.data$Paired_end$R2_rightTrim)
  return(my_class_ss)

  setValidity("hts_NTrimmer", validNTrimmer)
  validNTrimmer(my_class_ss)

}
