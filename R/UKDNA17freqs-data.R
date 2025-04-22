#' UK DNA-17 Allele Frequency Data for 16 STR Loci
#'
#' A dataset containing allele frequencies for 16 autosomal STR loci from the
#' UK Population dataset. Frequencies are provided for four
#' population groups: \code{"White_-_EA1_&_EA2"},
#' \code{"Black_African_&_Caribbean_-_EA3"}, \code{"Indian_-_EA4"} and
#' \code{"Chinese_-_EA5"}.
#'
#' Each population group is a named list of 16 elements, where each element
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
#' @format A named list of length 4.
#'
#' Each element is itself a named list of 16 STR loci, with named numeric vectors of allele frequencies.
#'
#' @source Data to support the implementation of National DNA Database. \url{https://www.gov.uk/government/statistics/dna-population-data-to-support-the-implementation-of-national-dna-database-dna-17-profiling}
#'
#' @examples
#' # Access allele frequencies for D3S1358 in the Indian_-_EA4 population
#' UKDNA17freqs$`Indian_-_EA4`$D3S1358
#'
#' # Frequency of allele "15" at D3S1358 in the Indian_-_EA4 population
#' UKDNA17freqs$`Indian_-_EA4`$D3S1358["15"]
#'
"UKDNA17freqs"
