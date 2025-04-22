
require(readODS)

filename <- "DNA-17_PopulationData_FINAL_For_Web_Page__2_.ods"

sheet_names <- readODS::list_ods_sheets(filename)
#> sheet_names
#[1] "Data_Summary"       "White_-_EA1_&_EA2"  "Black_African_&_Caribbean_-_EA3"
#[4] "Indian_-_EA4"       "Chinese_-_EA5"      "African"
#[7] "African_Caribbean"

UKDNA17freqs <- list()

for (i_sheet in 2:5){
  x <- readODS::read_ods(filename,
                    sheet = 3,
                    col_types = paste0(rep("c", 17), collapse = ""))


  x <- x[-nrow(x),]

  # convert alleles to character such that
  # "17.100000000000001" becomes "17.1"
  # and "5.0" becomes "5"
  allele <- as.character(as.numeric(x$Allele))

  locus_names <- names(x)[-1]
  df_counts <- do.call(rbind, lapply(locus_names, function(locus_name){
    count <- as.double(x[[locus_name]])
    idx_positive <- !is.na(count)

    data.frame(locus = locus_name, allele = allele[idx_positive],
               count = count[idx_positive])

  }))

  UKDNA17freqs[[sheet_names[i_sheet]]] <- allele_counts_to_freqs(df_counts)
}

usethis::use_data(UKDNA17freqs, overwrite = TRUE)
