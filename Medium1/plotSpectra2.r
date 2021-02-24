#'
#' Plot Spectra Object
#'
#' Plots the spectra stored in a \code{\link{Spectra}} object.  One may choose
#' which spectra to plot, and the x range to plot.
#' The vertical scale is controlled by a combination of
#' several parameters.
#'
#' @param spectra An object of S3 class \code{\link{Spectra}}.
#'
#' @param which An integer specifying which spectra to plot.
#'
#' @param yrange A vector giving the limits of the y axis desired, for instance
#' \code{c(0, 15)}.  This parameter depends upon the range of values in the
#' stored spectra and defaults to the height of the largest peak in the data
#' set.  Interacts with the next two arguments, as well as the number of
#' spectra to be plotted as given in \code{which}.  Trial and error is used to
#' adjust all these arguments to produce the desired plot.
#'
#' @param amplify A number specifying an amplification factor to be applied to
#' all spectra.  Useful for magnifying spectra so small features show up
#' (though large peaks will then be clipped, unless you zoom on the x axis).
#'
#' @param lab.pos A number giving the location for the identifying label.
#' Generally, pick an area that is clear in all spectra plotted.  If no label
#' is desired, give \code{lab.pos} outside the plotted x range.
#'
#' @param showGrid Logical.  Places light gray vertical lines at each tick mark
#' if \code{TRUE}.
#'
#' @param leg.loc Character; if \code{"none"} no legend will be drawn.
#' Otherwise, any string acceptable to \code{\link{legend}}.
#'
#' @param \dots Additional parameters to be passed to plotting functions.
#'
#' @return None.  Side effect is a plot.


plotSpectra2<-function(spectra,which,
                       yrange = range(spectra$data),
                       amplify = 1.0,
                       lab.pos=mean(spectra$freq),
                       showGrid = TRUE ,leg.loc = "none" , ...) {
  chkSpectra(spectra)
  
  # set up and plot the first spectrum
  spectrum<-spectra$data[which,]*amplify
  
  plot(spectra$freq, spectrum,
       type = "n",
       xlab = spectra$unit[1], ylab = spectra$unit[2],
       ylim = yrange,
       frame.plot = FALSE, ...
  )
  if (showGrid) grid(ny = NA, lty = 1) # grid will be underneath all spectra
  lines(spectra$freq, spectrum, col = spectra$colors[which], ...)
  lab.x <- lab.pos
  spec.index <- findInterval(lab.x, sort(spectra$freq))
  lab.y <- spectrum[spec.index]
  text(lab.x, lab.y, labels = spectra$names[which], pos = 3, cex = 0.75)
  if (all(leg.loc != "none")) .addLegend(spectra, leg.loc, use.sym = FALSE, bty = "n")
}  

library(ChemoSpec)
data("SrE.IR")
plotSpectra(SrE.IR,
            which = 10, yrange = c(0, 1.5),
            amplify = 10, lab.pos = 0.5,
            leg.loc = list(x = 3.2, y = 1.45)
)
