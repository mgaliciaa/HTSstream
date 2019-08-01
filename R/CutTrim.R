hts_CutTrim <- setClass("hts_CutTrim", contains = c("hts_Trimmer"))

hts_CutTrim <- function(CutTrim.data = list()){
  expected <- c("Notes", "totalFragmentsInput", "totalFragmentsOutput", "SE_in",
                "SE_out", "SE_rightTrim", "SE_leftTrim", "SE_discarded", "PE_in", "PE_out",
                "R1_leftTrim", "R1_rightTrim", "R2_leftTrim", "R2_rightTrim",
                "R1_discarded", "R2_discarded", "PE_discarded")
  if (!all(names(expected) == expected)) {
    stop("error with message")}

  my_class_ss <- new("hts_CutTrim", Notes = CutTrim.data$Notes,
                     totalFragmentsInput = CutTrim.data$totalFragmentsInput,
                     totalFragmentsOutput = CutTrim.data$totalFragmentsOutput,
                     SE_in = CutTrim.data$Single_end$SE_in,
                     SE_out = CutTrim.data$Single_end$SE_out,
                     SE_rightTrim = CutTrim.data$Single_end$SE_rightTrim,
                     SE_leftTrim = CutTrim.data$Single_end$SE_leftTrim,
                     SE_discarded = CutTrim.data$Single_end$SE_discarded,
                     PE_in = CutTrim.data$Paired_end$PE_in,
                     PE_out = CutTrim.data$Paired_end$PE_out,
                     R1_leftTrim = CutTrim.data$Paired_end$R1_leftTrim,
                     R1_rightTrim = CutTrim.data$Paired_end$R2_rightTrim,
                     R2_leftTrim = CutTrim.data$Paired_end$R2_leftTrim,
                     R2_rightTrim = CutTrim.data$Paired_end$R2_rightTrim,
                     R1_discarded = CutTrim.data$Paired_end$R1_discarded,
                     R2_discarded = CutTrim.data$Paired_end$R2_discarded,
                     PE_discarded = CutTrim.data$Paired_end$PE_discarded)
  return(my_class_ss)

  setValidity("hts_CutTrim", validCutTrim)
  validCutTrim(my_class_ss)

}
