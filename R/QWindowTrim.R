hts_QWindowTrim <- setClass(Class = "hts_QWindowTrim", contains = "hts_Trimmer")

hts_QWindowTrim <- function(QWindowTrim.data = list()){
  expected <- c("Notes", "totalFragmentsInput", "totalFragmentsOutput", "SE_in", "SE_out", "SE_rightTrim",
                "SE_leftTrim", "SE_discarded", "PE_in", "PE_out", "R1_leftTrim", "R1_rightTrim", "R2_leftTrim",
                "R2_rightTrim", "R1_discarded", "R2_discarded", "PE_discarded")
  if (!all(names(expected) == expected)) {
    stop("error with message")}

  my_class_ss <- new("hts_QWindowTrim",
                     Notes = QWindowTrim.data$Notes,
                     totalFragmentsInput = QWindowTrim.data$totalFragmentsInput,
                     totalFragmentsOutput = QWindowTrim.data$totalFragmentsOutput,
                     SE_in = QWindowTrim.data$Single_end$SE_in,
                     SE_out = QWindowTrim.data$Single_end$SE_out,
                     SE_rightTrim = QWindowTrim.data$Single_end$SE_rightTrim,
                     SE_leftTrim = QWindowTrim.data$Single_end$SE_leftTrim,
                     SE_discarded = QWindowTrim.data$Single_end$SE_discarded,
                     PE_in = QWindowTrim.data$Paired_end$PE_in,
                     PE_out = QWindowTrim.data$Paired_end$PE_out,
                     R1_leftTrim = QWindowTrim.data$Paired_end$R1_leftTrim,
                     R1_rightTrim = QWindowTrim.data$Paired_end$R1_rightTrim,
                     R2_leftTrim = QWindowTrim.data$Paired_end$R2_leftTrim,
                     R2_rightTrim = QWindowTrim.data$Paired_end$R2_rightTrim,
                     R1_discarded = QWindowTrim.data$Paired_end$R1_discarded,
                     R2_discarded = QWindowTrim.data$Paired_end$R2_discarded,
                     PE_discarded = QWindowTrim.data$Paired_end$PE_discarded)
  return(my_class_ss)

  setValidity("hts_QWindowTrim", validQWindowTrimr)
  validQWindowTrim(my_class_ss)

}
