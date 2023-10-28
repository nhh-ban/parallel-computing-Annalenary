library(tictoc)
printTicTocLog <-
  function() {
    tic.log() %>%
      unlist %>%
      tibble(logvals = .) %>%
      separate(logvals,
               sep = ":",
               into = c("Function type", "log")) %>%
      mutate(log = str_trim(log)) %>%
      separate(log,
               sep = " ",
               into = c("Seconds"),
               extra = "drop")
  }

tic.clearlog()


tic(paste0("current solution"))
source("scripts/current_solution.R")
toc(log=TRUE)

tic(paste0("Parallel loop, ", Cores, " cores"))
source("scripts/parallel_programming_solution.R")
toc(log=TRUE)

tic(paste0("MTweedie Adapted, ", Cores, " cores"))
source("scripts/MTweede_adapted_solution.R")
toc(log=TRUE)

printTicTocLog() %>%
  knitr::kable()

#there seems to be an issue with the adaption of the Mtweedie Function 
#as it takes super long to run the code.
