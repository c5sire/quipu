\name{rquipu}
\alias{rquipu}
\title{Creates quipu-type charts for a set of SSR markers}
\usage{
rquipu(accession, marker, marker.size, map.location, ylim = c(50, 350),
  res = c(800, 800), dir.print = "D:", dir.logo = NA,
  col.fig = c("red3", "gray30", "gray40", "gray50"), col.marg = c("gray60",
  "black", "black"), species.name = NA, set.name = NA,
  img.format = c("jpeg", "png"), id.prefix = "", ltr.size = 0.8,
  show.accs.total = TRUE, id.label = "Identifier")
}
\arguments{
  \item{accession}{a column from table containing accession
  ids: one for each marker size}

  \item{marker}{a column from table containing marker
  names: one for each marker size}

  \item{marker.size}{a column from a table containing
  marker sizes}

  \item{map.location}{a column from table containing map
  locations of each marker: one for each marker size}

  \item{ylim}{the range of marker sizes (or alleles) in
  base pair (bp) units}

  \item{res}{the resolution of the final image in pixels
  (width, height)}

  \item{dir.print}{the directory to use for storing the
  created images}

  \item{dir.logo}{the path to a logo to display on the
  chart}

  \item{col.fig}{colors for the chart elements}

  \item{col.marg}{colors for the chart margin elements}

  \item{species.name}{scientific name of the species of the
  set of accessions}

  \item{set.name}{a name for the set of accessions}

  \item{img.format}{specify a format for the final chart
  (jpeg or png)}

  \item{id.prefix}{a prefix for the accession id}

  \item{ltr.size}{letter size}

  \item{show.accs.total}{a logical value to show the number
  of accessions from the dataset}

  \item{id.label}{label for identifier}
}
\description{
The chart shows SSR marker weights on a linear scale where
each allele or 'gel band' is represented by a circle. The
circle's diameter is sized inversely by its rareness within
the set of accessions in the database at hand
}
\details{
The chart was motivated by the need to represent genetic
uniqueness of potato plant materials in a given set for a
catalogue and the Andean tradition of quipus.
}
\examples{
library(quipu)

data("potato.quipu", package="quipu")

dat = potato.quipu

# Load your data: uncomment the following two lines:

# fn = file.choose()
# dat= read.csv(fn)


width = 1500
height = 1200

rquipu(dat$accession_id, dat$primer_name, dat$marker_size, dat$map_location,
       species.name="Solanum tuberosum", set.name="Advanced clones",res=c(width,height),
       dir.print = tempdir())



}
\author{
Reinhard Simon, Pablo Carhuapoma
}

