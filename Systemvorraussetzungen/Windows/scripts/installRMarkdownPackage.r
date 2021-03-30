# Installs Pandoc by using the installr r package
# @author: Martin Teuber

R_LIBS_USER <- gsub("\\\\", "/", Sys.getenv("R_LIBS_USER"))

# Make package dir in user folder and add the user path to the libPaths vector
if (!dir.exists(R_LIBS_USER)) {
  dir.create(R_LIBS_USER, recursive = TRUE)
}
if (!(R_LIBS_USER %in% .libPaths())) {
  .libPaths(c(.libPaths(), R_LIBS_USER))
}

# Installs package rmarkdown and requirements of it if not already installed
if (!require(rmarkdown)){
  install.packages("rmarkdown", R_LIBS_USER,
    repos = "https://cran.uni-muenster.de/")
  tinytex::install_tinytex()
}
