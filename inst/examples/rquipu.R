library(quipu)

data("potato.quipu", package="quipu")

dat = potato.quipu
width = 1500
height = 1000

rquipu(dat$accession_id, dat$marker, dat$marker_size, dat$map_location,
       species.name="Solanum tuberosum", set.name="Advanced clones",res=c(width,height),
       dir.print = tempdir())
