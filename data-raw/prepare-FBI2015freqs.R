rm(list=ls())
require(readxl)
require(forensicpopdata)

# read frequencies
filename <- "Moretti2016.xlsx"
sheet_names <- readxl::excel_sheets(filename)

FBI2015freqs <- list()

for (i_population in seq_along(sheet_names)){
  population_name <- sheet_names[i_population]

  x <- readxl::read_excel(filename, sheet = i_population, skip = 1,
                          col_types = "text")


  locus_names_original <- names(x)[!startsWith(names(x), "Allele")]
  locus_names_filtered <- locus_names_original[locus_names_original != "Y indel" &
                                               locus_names_original != "DYS391"]

  locus_names_out <- locus_names_filtered
  locus_names_out[locus_names_out == "PENTA E"] <- "Penta E"
  locus_names_out[locus_names_out == "PENTA D"] <- "Penta D"

  counts_by_locus <- list()
  for (i_locus in seq_along(locus_names_filtered)){
    idx_N <- which(x$Allele...1 == "N")
    data_range <- seq_len(idx_N - 2)

    allele_chr <- x$Allele...1[data_range]

    remove_allele <- ">27"

    retain_allele_chr_idx <- !(allele_chr %in% remove_allele)
    allele_chr_filtered <- allele_chr[retain_allele_chr_idx]

    allele <- as.character(as.numeric(allele_chr_filtered))

    freq_chr <- x[[locus_names_filtered[i_locus]]][data_range]
    freq_chr[is.na(freq_chr)] <- "0"
    freq_chr_filtered <- freq_chr[retain_allele_chr_idx]

    freq <- as.numeric(freq_chr_filtered)

    allele_pos <- allele[freq>0]
    freq_pos <- freq[freq>0]

    locus_N <- as.numeric(x[[locus_names_filtered[i_locus]]][idx_N])

    N_removed <- as.numeric(freq_chr[allele_chr %in% remove_allele]) * locus_N
    if (length(N_removed) == 0) N_removed <- 0

    count <- freq_pos * locus_N
    stopifnot(all.equal(round(count), count))
    stopifnot(all.equal(sum(count), locus_N - N_removed))

    counts_by_locus[[i_locus]] <- data.frame(population = population_name,
               locus = locus_names_out[i_locus],
               allele = allele_pos,
               count = as.integer(count))

  }

  locus_allele_count <- do.call(rbind, counts_by_locus)

  FBI2015freqs[[population_name]] <- forensicpopdata::allele_counts_to_freqs(locus_allele_count)
}

usethis::use_data(FBI2015freqs, overwrite = TRUE)

