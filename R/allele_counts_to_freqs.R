#' @title Convert allele counts data frame to list of frequencies by locus
#'
#' @param x A data fram with columns: \code{locus}, \code{allele}, and
#'          \code{count}.
#' @param remove_zeroes Logical. Should zero-count alleles be removed? Default
#'        is \code{TRUE}.
#' @return Named list with frequencies per locus. Each element is a named
#'         numeric vector of allele frequencies.
#'         An attribute \code{N} gives the number of allele observations per
#'         locus.
#' @examples
#' x <- data.frame(
#'   locus = "D3S1358",
#'   allele = c("12", "13", "14", "15", "15.2", "16", "17", "18", "19"),
#'   count = c(3, 2, 62, 211, 1, 218, 145, 39, 3)
#' )
#' freqs <- allele_counts_to_freqs(x)
#' freqs
#' attr(freqs, "N")
#' @export
allele_counts_to_freqs <- function(x, remove_zeroes = TRUE) {
  stopifnot(all(c("locus", "allele", "count") %in% colnames(x)))

  x_by_locus <- split(x, x$locus)
  freqs <- list()
  N <- numeric()

  for (locus_name in unique(x$locus)) {
    x_locus <- x_by_locus[[locus_name]]

    counts <- stats::setNames(x_locus$count, x_locus$allele)
    f <- counts / sum(counts)

    if (remove_zeroes) {
      f <- f[f > 0]
    }

    freqs[[locus_name]] <- f
    N[locus_name] <- sum(counts)
  }

  attr(freqs, "N") <- N
  return(freqs)
}
