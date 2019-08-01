SeqScreener <- setClass("hts_SeqScreener",
                        slots = list(inverse = "integer",
                                     record = "integer",
                                     SE_hits = "integer",
                                     PE_hits = "integer"),
                        contains = "hts_Base")


hts_SeqScreener <- function(SeqScreener.data = list()){
  expected <- c("Notes", "totalFragmentsInput", "totalFragmentsOutput",
                "inverse", "record", "SE_in", "SE_out", "SE_hits", "PE_in", "PE_out", "PE_hits")
  if (!all(names(expected) == expected)) {
    stop("error with message")}

  my_class_ss <- new("hts_SeqScreener", Notes = SeqScreener.data$Notes,
                     totalFragmentsInput = SeqScreener.data$totalFragmentsInput,
                     totalFragmentsOutput = SeqScreener.data$totalFragmentsOutput,
                     inverse = SeqScreener.data$inverse,
                     record = SeqScreener.data$record,
                     SE_in = SeqScreener.data$Single_end$SE_in,
                     SE_out = SeqScreener.data$Single_end$SE_out,
                     SE_hits = SeqScreener.data$Single_end$SE_hits,
                     PE_in = SeqScreener.data$Paired_end$PE_in,
                     PE_out = SeqScreener.data$Paired_end$PE_out,
                     PE_hits = SeqScreener.data$Paired_end$PE_hits)
  return(my_class_ss)

  setValidity("hts_SeqScreener", hts_SeqScreener)
  validObject(my_class_ss, test = FALSE)

}
