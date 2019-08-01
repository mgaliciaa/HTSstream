hts_PolyATTrim <- setClass("hts_PolyATTrim", contains = c("hts_Base", "hts_discarded", "hts_Trimmer"))

hts_PolyATTrim <- function(PolyATTrim.data = list()){
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

  my_class_ss <- new("hts_PolyATTrim", Notes = PolyATTrim.data$Notes,
                     totalFragmentsInput = PolyATTrim.data$totalFragmentsInput,
                     totalFragmentsOutput = PolyATTrim.data$totalFragmentsOutput,
                     SE_in = PolyATTrim.data$Single_end$SE_in,
                     SE_out = PolyATTrim.data$Single_end$SE_out,
                     SE_rightTrim = PolyATTrim.data$Single_end$SE_rightTrim,
                     SE_leftTrim = PolyATTrim.data$Single_end$SE_leftTrim,
                     PE_in = PolyATTrim.data$Paired_end$PE_in,
                     PE_out = PolyATTrim.data$Paired_end$PE_out,
                     R1_leftTrim = PolyATTrim.data$Paired_end$R1_leftTrim,
                     R1_rightTrim = PolyATTrim.data$Paired_end$R2_rightTrim,
                     R2_leftTrim = PolyATTrim.data$Paired_end$R2_leftTrim,
                     R2_rightTrim = PolyATTrim.data$Paired_end$R2_rightTrim)
  return(my_class_ss)

  setValidity("hts_PolyATTrim", validPolyATTrim)
  validPolyATTrim(my_class_ss)

}
