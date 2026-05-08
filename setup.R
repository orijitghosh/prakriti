# Run this once after cloning, or whenever roxygen comments change.
# It generates man/*.Rd from the #' comments in R/, runs tests, and
# performs a CRAN-style check.

if (!requireNamespace("devtools", quietly = TRUE)) install.packages("devtools")
if (!requireNamespace("roxygen2", quietly = TRUE)) install.packages("roxygen2")
if (!requireNamespace("testthat", quietly = TRUE)) install.packages("testthat")

devtools::document()    # generates man/*.Rd and refreshes NAMESPACE
devtools::load_all()    # loads the package into the session
devtools::test()        # runs tests in tests/testthat/
# devtools::check()     # full R CMD check --as-cran (slower; uncomment when ready)

message("\nReady. Try: source('tutorial.R')\n")
