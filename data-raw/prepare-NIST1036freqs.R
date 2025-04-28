require(readxl)

# read genotypes
x <- readxl::read_excel("1036-Revised-Genotypes-PopStats-July-19-2017.xlsx", col_types = "text")
# relabel AA pop to AfAm
x$Pop[x$Pop == "AA"] <- "AfAm"

loci_idx <- seq(from = 3, to = length(x), by = 2)
locus_names <- names(x)[loci_idx]

# function that takes genotype data for single pop and
# returns df with population, locus, allele, count
x_pop_to_locus_allele_count <- function(x_pop, population_name){

  by_locus <- list()

  for (locus_name in locus_names){
    a <- x_pop[[locus_name]]
    b <- x_pop[[match(locus_name, names(x_pop)) + 1]]

    alleles <- as.character(as.numeric(c(a, b)))
    alleles_unique <- unique(alleles)
    alleles_unique_ordered <- as.character(sort(as.numeric(alleles_unique)))

    alleles_table <- table(factor(x = alleles, levels = alleles_unique_ordered))

    by_locus[[locus_name]] <-
      data.frame(population = population_name,
               locus = locus_name,
               allele = alleles_unique_ordered,
               count = as.integer(alleles_table))
  }

  do.call(rbind, by_locus)
}

x_by_pop <- split(x, x$Pop)

locus_allele_count_by_pop <- list()
for (i_pop in seq_along(x_by_pop)){
  x_pop <- x_by_pop[[i_pop]]
  population_name <- names(x_by_pop)[i_pop]

  locus_allele_count_by_pop[[population_name]] <-
    x_pop_to_locus_allele_count(x_pop, population_name)
}

NIST1036freqs <- list()
for (population_name in names(locus_allele_count_by_pop)){
  NIST1036freqs[[population_name]] <-
    allele_counts_to_freqs(locus_allele_count_by_pop[[population_name]])

}

usethis::use_data(NIST1036freqs, overwrite = TRUE)
