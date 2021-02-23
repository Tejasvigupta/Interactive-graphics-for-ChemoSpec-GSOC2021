#Loading the library
library(ChemoSpec)
#loading the dataset
data(SrE.IR)
#Getting the summary of the dataset
sumSpectra(SrE.IR)
#Getting the column numbers with pure Serenoa repens extract samples
grep("pSrE")
myt <- expression(
  bolditalic(Serenoa)~
    bolditalic(repens)~
    bold(Extract~IR~Spectra))
#Plotting the data
plotSpectra(SrE.IR,
            main = myt,
            which = c(2,5,6,9),
            yrange = c(0, 1.6),
            offset = 0.4,
            lab.pos = 2200)
