#' FBI 2015 Population Data for the expanded CODIS core STR loci
#'
#' A data set containing allele frequencies for 23 autosomal STR loci from the
#' FBI 2015 population data set. Frequencies are provided for are determined
#' with both the GlobalFiler and Fusion kits in African Americans, Caucasians,
#' Southeastern Hispanics, Southwestern Hispanics, Bahamians, Jamaicans,
#' Trinidadians, Apaches, Navajos, Chamorros and Filipinos.
#'
#' Each population group is a named list of 23 elements, where each element
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
#' @format A named list of length 12.
#'
#' Each element is itself a named list of 23 STR loci, with named numeric vectors of allele frequencies.
#'
#' @source Raw data (public domain) on which the data set is based is available
#'         online on \url{https://ucr.fbi.gov/lab/biometric-analysis/codis/expanded-fbi-str-2015-final-6-16-15.pdf}
#'
#' @examples
#' # Access allele frequencies for D3S1358 in African American population
#' FBI2015freqs$`African American`$D3S1358
#'
#' # Frequency of allele "15" at D3S1358 in Caucasian population
#' FBI2015freqs$Caucasian$D3S1358["15"]
#'
#' @references
#' Moretti, T.R., et al. (2016)
#' \emph{Population data on the expanded CODIS core STR loci for eleven populations of significance for forensic DNA analyses in the United States}.
#' Forensic Sci. Int. Genet. 25:p175–181.
#' \doi{10.1016/j.fsigen.2016.07.022}
#'
"FBI2015freqs"
