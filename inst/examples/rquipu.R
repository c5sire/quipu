library(quipu)

data(potato.quipu)
dat = potato.quipu

str(dat)

rquipu(dat)

rquipu(dat, layout="no text", res=c(600,400))


# This example produces high resolution output.
# It also shows more customization regarding colors and sizes of
# different elements.


rquipu(dat,
       layout="no text",
       img.format = "tiff",
       vertical.lines.width = 6,
       col.node = c("turquoise", "orange", "red", "purple"),
       lines.vertical.color = "wheat1",
       ranges.color = "wheat2", # allelic size range of set
       support.color = "wheat3",
       support.width = 8
)
