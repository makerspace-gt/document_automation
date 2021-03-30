# Installs Pandoc by using the installr r package
# @author: Martin Teuber

R_LIBS_USER <- gsub("\\\\", "/", Sys.getenv("R_LIBS_USER"))

# Installs pandoc if not available
library(rmarkdown)
if (!pandoc_available()){
  if (!require(installr)){
    install.packages("installr", R_LIBS_USER,
      repos = "https://cran.uni-muenster.de/")
  }
  library(installr)
  install.pandoc(to_restart = FALSE)
}