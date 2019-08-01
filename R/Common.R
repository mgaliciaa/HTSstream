Base <- setClass("hts_Base",
                 slots = list(Notes = "character",
                              totalFragmentsInput = "integer",
                              totalFragmentsOutput = "integer",
                              SE_in = "integer",
                              SE_out = "integer",
                              PE_in = "integer",
                              PE_out = "integer"))

discarded <- setClass("hts_discarded",
                      slots = list(R1_discarded = "integer",
                                   R2_discarded = "integer",
                                   PE_discarded = "integer",
                                   SE_discarded = "integer"),
                      contains = c("hts_Base"))

hts_Trimmer <- setClass("hts_Trimmer",
                        slots = list(SE_rightTrim = "integer",
                                     SE_leftTrim = "integer",
                                     R1_leftTrim = "integer",
                                     R1_rightTrim = "integer",
                                     R2_leftTrim = "integer",
                                     R2_rightTrim = "integer"),
                        contains = c("hts_discarded"))




