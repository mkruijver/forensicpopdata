% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/read_allele_freqs.R
\name{read_allele_freqs}
\alias{read_allele_freqs}
\title{Read allele frequencies in FSIgen format (.csv)}
\usage{
read_allele_freqs(filename, remove_zeroes = TRUE, normalise = TRUE)
}
\arguments{
\item{filename}{Path to csv file.}

\item{remove_zeroes}{Logical. Should frequencies of 0 be removed from the return value? Default is TRUE.}

\item{normalise}{Logical. Should frequencies be normalised to sum to 1? Default is TRUE.}
}
\value{
Named list with frequencies by locus. The frequencies at a locus are returned as a named numeric vector with names corresponding to alleles.
}
\description{
Read allele frequencies in FSIgen format (.csv)
}
\details{
Reads allele frequencies from a .csv file. The file should be in FSIgen format, i.e.
         comma separated with the first column specifying the allele labels and
         one column per locus. The last row should be the number of observations.
         No error checking is done since the file format is only loosely defined,
         e.g. we do not restrict the first column name or the last row name.
}
\examples{
# below we read an allele freqs file that comes with the package
filename <- system.file("extdata","FBI_extended_Cauc_022024.csv",package = "forensicpopdata")
freqs <- read_allele_freqs(filename)
freqs # the output is a list with an attribute named \code{N} giving the sample size.
}
