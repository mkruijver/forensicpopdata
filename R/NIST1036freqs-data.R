#' NIST 1036 Allele Frequency Data for 29 STR Loci
#'
#' A dataset containing allele frequencies for 29 autosomal STR loci from the
#' NIST 1036 U.S. Population dataset. Frequencies are provided for four
#' population groups: African American (\code{AfAm}), Asian (\code{Asian}),
#' Caucasian (\code{Cauc}), and Hispanic (\code{Hisp}).
#'
#' This dataset is based on the revised genotypes from 2017. The 2017 revision
#' incorporates some changes to the dataset from Hill et al. (2013). Details are
#' provided in the referenced NIST presentation explaining revisions (2017) and
#' Steffen et al. (2017).
#'
#' Each population group is a named list of 29 elements, where each element
#' corresponds to a specific STR locus (e.g., \code{D3S1358}, \code{vWA},
#' \code{FGA}, etc.).
#' Each locus is represented as a named numeric vector:
#' \itemize{
#'   \item \strong{Names}: allele values (as character strings, e.g., \code{"12"}, \code{"14.2"})
#'   \item \strong{Values}: allele frequencies for that population group
#' }
#'
#' An attribute \code{"N"} is attached to each population list, specifying the
#' sample size (number of alleles) for each locus.
#'
#' @format A named list of length 4:
#' \describe{
#'   \item{\code{AfAm}}{African American allele frequencies}
#'   \item{\code{Asian}}{Asian allele frequencies}
#'   \item{\code{Cauc}}{Caucasian allele frequencies}
#'   \item{\code{Hisp}}{Hispanic allele frequencies}
#' }
#' Each element is itself a named list of 29 STR loci, with named numeric vectors of allele frequencies.
#'
#' @source U.S. Population Dataset 1036 (NIST). \url{https://strbase.nist.gov}
#'
#' @examples
#' # Access allele frequencies for D3S1358 in African American population
#' NIST1036freqs$AfAm$D3S1358
#'
#' # Frequency of allele "15" at D3S1358 in Caucasian population
#' NIST1036freqs$Cauc$D3S1358["15"]
#'
#' @references
#' Hill, C. R., Duewer, D. L., Kline, M. C., et al. (2013).
#' \emph{U.S. population data for 29 autosomal STR loci}.
#' Forensic Sci. Int. Genet. 7:e82–e83.
#' \url{https://doi.org/10.1016/j.fsigen.2012.12.004}
#'
#' Steffen, C. R., Coble, M. D., Gettings, K. B., et al. (2017).
#' \emph{Corrigendum to "U.S. Population Data for 29 Autosomal STR Loci" [Forensic Sci. Int. Genet. 7 (2013) e82–e83]}.
#' Forensic Sci. Int. Genet. 31:e36–e40.
#' \url{https://doi.org/10.1016/j.fsigen.2017.08.011}
#'
#' NIST presentation explaining revisions (2017):
#' \url{https://strbase.nist.gov/NIST_Resources/Population_Data/Vallone-Error-Management-July-25-2017.pdf}
#'
"NIST1036freqs"
