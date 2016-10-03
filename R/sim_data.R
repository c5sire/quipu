#library(magrittr)
#library(stringr)
#load(potato.quipu)

sim_data <- function(n = 5){
  potato.quipu = NULL
  utils::data(potato.quipu, envir = environment())
  tbl = potato.quipu
  rm(potato.quipu)
  
  nm = paste0(tbl$primer_name, ".", tbl$marker_size) #%>% unique %>% sort
  nm = unique(nm)
  nm = sort(nm)
  m = length(nm)
  df = as.data.frame(matrix(NA, nrow = n, ncol = m), stringsAsFactors = FALSE)
  names(df) = nm
  for(i in 1:n){
    df[i, ] = sample(c(NA, 0, 1), size = m, prob = c(.04, .48, .48), replace = TRUE)
  }
  cbind(accession_id = paste0('sample.', 1:n), df)
}

ssr_map = as.data.frame(cbind(
  marker = c("STG0016", "STM5127", "STM1064", "STM5114", "STG0010", "STM1053", "STI0001",
             "STI0012", "STI0032", "STPoAc58", "STI0004", "STI0033", "STM0031",
             "STI0003", "STM1104", "STI0014", "STM1052", "STG0025", "STM1106",
             "STG0001", "STM0037", "STI0030", "STM5121"), 
  map = c("I", "I", "II", "II", "III", "III", "IV", "IV", "V", "V", "VI",
          "VII", "VII",  "VIII", "VIII", "IX", "IX", "X","X", "XI", "XI", "XII", "XII")                      
  ), stringsAsFactors = FALSE
  )
# 
# simdat = sim_data(10)
# attr(simdat, "map") = ssr_map
# #
# save(simdat, file = "data/simdat.rda")

# wb = openxlsx::createWorkbook("simdat")
# openxlsx::addWorksheet(wb, "scores")
# openxlsx::addWorksheet(wb, "map")
# openxlsx::writeData(wb, sheet = "scores", simdat)
# openxlsx::writeData(wb, sheet = "map", attr(simdat, "map"))
# openxlsx::saveWorkbook(wb, "simdat.xlsx", overwrite = TRUE)


