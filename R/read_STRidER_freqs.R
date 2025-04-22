#' @title Parse allele frequencies from STRidER database
#' @param xml_file Path to XML file. Default is \code{"https://strider.online/frequencies/xml"}
#' @return A named list by population. Each population is a list of loci with
#'         named numeric vectors of allele frequencies. Each vector has an
#'         attribute \code{N} for sample size (number of alleles observed).
#' @references Bodner M. et al. (2016), 'Recommendations of the DNA Commission
#' of the International Society for Forensic Genetics (ISFG) on quality control
#'  of autosomal Short Tandem Repeat allele frequency databasing (STRidER).',
#'  Forensic Sci. Int. Genet. 24, 97-102.
#'  \doi{10.1016/j.fsigen.2016.06.008}
#'
#'  @examples
#'  #' \dontrun{
#'  # Import STRidER database
#'  freqs <- read_STRidER_xml()
#'
#'  # Origins
#'  names(freqs)
#'
#'  # Access frequencies at the TH01 locus for the NORWAY origin
#'  freqs$NORWAY$TH01
#' }
#' @export
read_STRidER_xml <- function(xml_file = "https://strider.online/frequencies/xml") {
  doc <- xml2::read_xml(xml_file)

  markers <- xml2::xml_find_all(doc, ".//marker")

  freqs_by_origin <- list()
  N_by_origin <- list()

  for (marker in markers) {
    locus_name <- xml2::xml_text(xml2::xml_find_first(marker, "./name"))
    origins <- xml2::xml_find_all(marker, "./origin")

    for (origin in origins) {
      origin_name <- xml2::xml_attr(origin, "name")

      freqs <- xml2::xml_find_all(origin, "./frequency")
      alleles <- xml2::xml_attr(freqs, "allele")
      values <- as.numeric(xml2::xml_text(freqs))

      f_locus <- stats::setNames(values, alleles)

      if (!origin_name %in% names(freqs_by_origin)) {
        freqs_by_origin[[origin_name]] <- list()
      }

      freqs_by_origin[[origin_name]][[locus_name]] <- f_locus

      if (!origin_name %in% names(N_by_origin)) {
        N_by_origin[[origin_name]] <- numeric()
      }
      sample_size <- as.numeric(xml2::xml_attr(origin, "n"))
      N_by_origin[[origin_name]][locus_name] <- sample_size

    }
  }

  for (origin_name in names(freqs_by_origin)){
    attr(freqs_by_origin[[origin_name]], "N") <- N_by_origin[[origin_name]]
  }

  freqs_by_origin
}
