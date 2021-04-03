# Specifies the contract text RMD file and the members CSV file and builds the
# Transfer_Rights_of_Use_Wissenshaeppchen_3D-Druck PDF file
# @author: Martin Teuber

WORKING_DIR <- paste0('Nutzungsrechtsuebertragung/',
  '21-03-30_Filmprojekt_Wissenshaeppchen_3D-Druck/')
TITLE <- 'Vertrag &uuml;ber die &Uuml;bertragung von Nutzungsrechten'
CONTRACT_TEXT_FILE_NAME <- 'Transfer_Rights_of_Use_Wissenshaeppchen_3D-Druck'
CONTRACT_TEXT_FILE <- paste0(WORKING_DIR, CONTRACT_TEXT_FILE_NAME ,'.rmd')
POSTSCRIPT = ""
MEMBERS_CSV_FILE <- paste0(WORKING_DIR, 'Members.csv')
OUTPUT_FILE <- paste0(WORKING_DIR, CONTRACT_TEXT_FILE_NAME, '.pdf')


# Renders the contract
library(rmarkdown)
if (pandoc_available()){
  rmarkdown::render('../../Frame_Contract_Makerspace_w_Members.rmd',
    output_file = OUTPUT_FILE,
    params = list(CONTRACT_TEXT_FILE = CONTRACT_TEXT_FILE,
      MEMBERS_CSV_FILE = MEMBERS_CSV_FILE, TITLE = TITLE,
      POSTSCRIPT = POSTSCRIPT))
} else {
  print("Rendering of document failed due to Pandoc is not available.")
}
