# Specifies the contract text RMD file and the members CSV file and builds the
# Transfer_Rights_of_Use_Wissenshaeppchen_3D-Druck PDF file
# @author: Martin Teuber

WORKING_DIR <- paste0('Urheberrechtsuebertragung/',
  '21-03-30_Filmprojekt_Wissenshaeppchen_3D-Druck/')
TITLE <- 'Vertrag über die Übertragung von Nutzungsrechten'
CONTRACT_TEXT_FILE <- paste0(
  WORKING_DIR, 'Transfer_Rights_of_Use_Wissenshaeppchen_3D-Druck.rmd')
MEMBERS_CSV_FILE <- paste0(WORKING_DIR, 'Members.csv')
OUTPUT_FILE <- paste0(
  WORKING_DIR, 'Transfer_Rights_of_Use_Wissenshaeppchen_3D-Druck.pdf')


# Renders the contract
library(rmarkdown)
if (pandoc_available()){
  rmarkdown::render('../../Frame_Contract_Makerspace_w_Members.rmd',
    output_file = OUTPUT_FILE,
    params = list(CONTRACT_TEXT_FILE = CONTRACT_TEXT_FILE,
      MEMBERS_CSV_FILE = MEMBERS_CSV_FILE, TITLE = TITLE))
} else {
  print("Rendering of document failed due to Pandoc is not available.")
}
