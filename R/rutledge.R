#' qPCR data set by Rutledge et al. (2004)
#'
#' @description
#' Each data set comprises a six-point, ten-fold dilution series, repeated in
#' five independent runs, for two different amplicons: K1/K2, 102 bp, and K3/K2,
#' 218 bp.
#' Fluorescence readings were exported after background subtraction via baseline
#' averaging of the 5 cycles immediately preceding the cycles in which
#' fluorescence was first detected. Please read the Materials and Methods
#' section of Rutledge et al. (2004) for more details.
#'
#' @format A [tibble][tibble::tibble-package] with 10,800 rows and 10 variables:
#' \describe{
#' \item{`plate`}{Plate identifier. Because one plate (run) was used per
#' dilution series, `plate` values are simply numbered 1 thru 5.}
#' \item{`well`}{Well identifier. Values are always `NA` (not available). This
#' variable is kept nevertheless to be coherent with other data sets from other
#' similar R data packages.}
#' \item{`dye`}{The type of dye used. In this data set the values are always
#' `"SYBR"`, meaning SYBR Green I master mix (Roche).}
#' \item{`target`}{Target identifier: the amplicon used, K1/K2 or K3/K2.}
#' \item{`sample_type`}{Sample type (all curves are standards, i.e. `"std"`).}
#' \item{`replicate`}{Replicate identifier: 1 thru 4.}
#' \item{`copies`}{Standard copy number.}
#' \item{`dilution`}{Dilution factor. Higher number means greater dilution.}
#' \item{`cycle`}{PCR cycle.}
#' \item{`fluor`}{Raw fluorescence values.}
#' }
#'
#' @examples
#' rutledge
#'
#' @source \doi{10.1093/nar/gnh177}
#' @name rutledge
#' @keywords datasets
NULL
