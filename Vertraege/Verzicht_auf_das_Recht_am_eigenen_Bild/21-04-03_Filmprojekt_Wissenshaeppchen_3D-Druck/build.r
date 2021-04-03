# Specifies the contract text RMD file and the members CSV file and builds the
# Transfer_Rights_of_Use_Wissenshaeppchen_3D-Druck PDF file
# @author: Martin Teuber

WORKING_DIR <- paste0('Verzicht_auf_das_Recht_am_eigenen_Bild/',
  '21-04-03_Filmprojekt_Wissenshaeppchen_3D-Druck/')
TITLE <- paste('Einwilligungserkl&auml;rung zur Ver&ouml;ffentlichung von',
  'Filmaufnahmen')
SUBTITLE <- 'Verzichtserkl&auml;rung'
CONTRACT_TEXT_FILE_NAME <- 'Model_Release_Wissenshaeppchen_3D-Druck'
CONTRACT_TEXT_FILE <- paste0(
  WORKING_DIR, CONTRACT_TEXT_FILE_NAME, '.rmd')
POSTSCRIPT = paste('Der Inhalt &sect;&nbsp;22 KunstUrhG lautet wie folgt:',
  '(Recht am eigenen Bild) Bildnisse d&uuml;rfen nur mit Einwilligung des',
  'Abgebildeten verbreitet oder &ouml;ffentlich zur Schau gestellt werden.',
  'Die Einwilligung gilt im Zweifel als erteilt, wenn der Abgebildete',
  'dafu&uuml;r, dass er sich abbilden l&auml;sst, eine Entlohnung',
  'erh&auml;lt. Nach dem Tode des Abgebildeten bedarf es bis zum Ablauf von',
  '10 Jahren der Einwilligung der Angeh&ouml;rigen des Abgebildeten.',
  'Angeh&ouml;rige im Sinne dieses Gesetzes sind der &uuml;berlebende',
  'Ehegatte oder Lebenspartner und die Kinder des Abgebildeten und, wenn',
  'weder ein Ehegatte oder Lebenspartner, noch Kinder vorhanden sind, die',
  'Eltern des Abgebildeten.')
MEMBERS_CSV_FILE <- 'Members.csv'

# Import the holder of rights data exported via JVerein
members <- read.csv2(MEMBERS_CSV_FILE, stringsAsFactors = FALSE,
    encoding = 'UTF-8')

# Renders the contract
library(rmarkdown)
if (pandoc_available()){
  for (i in 1:nrow(members)) {
    vorname <- members$mitglied_vorname[i]
    name <- members$mitglied_name[i]
    strasse <- members$mitglied_strasse[i]
    plz <- members$mitglied_plz[i]
    ort <- members$mitglied_ort[i]
    output_file <- paste0(
    WORKING_DIR, CONTRACT_TEXT_FILE_NAME, '_', i, '.pdf')
    rmarkdown::render('../../Frame_Contract_Makerspace_w_Members_1N1.rmd',
      output_file = output_file,
      params = list(CONTRACT_TEXT_FILE = CONTRACT_TEXT_FILE, TITLE = TITLE,
        SUBTITLE = SUBTITLE, POSTSCRIPT = POSTSCRIPT))
  }
} else {
  print('Rendering of document failed due to Pandoc is not available.')
}

## Loop
for (i in 1:nrow(personalized_info)) {
  rmarkdown::render(input = 'mail_merge_handout.Rmd',
 output_format = 'pdf_document',
 output_file = paste('handout_', i, '.pdf', sep = ''),
 output_dir = 'handouts/')
}

