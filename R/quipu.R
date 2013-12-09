#' Quipu-type charts for a set of SSR markers.
#' 
#' The chart shows SSR marker weights on a linear scale where each allele or 'gel band' is represented 
#' by a circle. The circle's diameter is sized inversely by its rareness within the set of accessions 
#' in the database at hand.
#' 
#' Motivation: Genebanks increasingly use molecular markers for routine
#' characterization of ex-situ collections and farmer managed diversity. CIP's
#' (International Potato Center) genebank presently uses a SSR marker-kit to
#' produce molecular profiles for potato accessions. We have been searching
#' for a compact graphical representation that shows both
#' molecular diversity and accession characteristics - thus permitting
#' biologists and collection curators to have a simpler way to interpret
#' high-volume data. Inspired by the ancient Andean quipus we devised a graph
#' that allows for standardized representation while leaving room for updates
#' of the marker kit and the collection of accessions. The graph has been used
#' in several CIP publications.
#' 
#' @name quipu-package
#' @docType package
NA

#' @name potato.quipu
#' @title SSR sample data for a set of potato accessions
#' @format Tabular format. The records represent unique SSR marker weights in base pairs as obtained
#'    for a set of three accessions. The combination of the first three columns is unique. The fourth
#'    column map_location is used for assigning markers to chromosomes or linkage groups.
#' \itemize{
#'  \item{"acccession_id"} {Accession ID}
#'  \item{"marker"} {Marker name}
#'  \item{"marker_size"} {Marker size}
#'  \item{"map_location"} {Genetic ap location; usually Roman numbers for chromosomes or linkage group.}
#' }
#' @docType data
#' @family datasets
#' @aliases potato.quipu
NULL




library(pixmap)

#' Creates quipu-type charts for a set of SSR markers
#' 
#' The chart shows SSR marker weights on a linear scale where each allele or 'gel band' is represented 
#' by a circle. The circle's diameter is sized inversely by its rareness within the set of accessions 
#' in the database at hand
#' 
#' The chart was motivated by the need to represent genetic uniqueness of potato plant materials in a given set
#' for a catalogue and the Andean tradition of quipus.
#'
#' @param accession a column from table containing accession ids: one for each marker size
#' @param marker a column from table containing marker names: one for each marker size
#' @param marker.size a column from a table containing marker sizes
#' @param map.location a column from table containing map locations of each marker: one for each marker size
#' @param ylim the range of marker sizes (or alleles) in base pair (bp) units
#' @param res the resolution of the final image in pixels (width, height)
#' @param dir.print the directory to use for storing the created images
#' @param dir.logo the path to a logo to display on the chart
#' @param col.fig colors for the chart elements
#' @param col.marg colors for the chart margin elements
#' @param species.name scientific name of the species of the set of accessions
#' @param set.name a name for the set of accessions
#' @param img.format specify a format for the final chart (jpeg or png)
#' @param id.prefix a prefix for the accession id
#' @example inst/examples/rquipu.R
#' @author Reinhard Simon, Pablo Carhuapoma
#' @aliases rquipu
#' @export
rquipu <-  function (accession, marker, marker.size, map.location, 
            ylim = c(50,350), 
            res=c(800,800),
            dir.print = "D:",
            dir.logo = system.file("pictures/logo.ppm", package="pixmap")[1], 
            col.fig = c("red3","gray30","gray40","gray50"), 
            col.marg = c("gray60","black","black"), 
            species.name = NA, 
            set.name = NA,
            img.format = c("jpeg","png"),
            id.prefix = "")
  {
    options(warn = -1)
    #try({
      CLON = accession
      MARK = marker
      SIZE = marker.size
      CROMOS = map.location
      
   dir=paste("In the folder ",dir.print,sep="")
   dat=data.frame(CIP.number=CLON,primer_name_original=MARK,Marker.size=SIZE,Cromosomas=CROMOS)
   
   ## sorting the data by level of chromosome
   dt2=data.frame(rm1=c("I","II","III","IV","V","VI","VII","VIII","IX","X","XI","XII","XIII","XIV","XV","XVI","XVII","XVIII","XIX","XX"),
                  valor=c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20))
   datos=data.frame(dat,rep("unknw",nrow(dat)))
   dt2=as.matrix(dt2)
   datos=as.matrix(datos)
   for(i in 1:nrow(dat))
   { 
     for(j in 1:nrow(dt2))
     {
       if(datos[i,4]==dt2[j,1]){datos[i,5]=dt2[j,2]}
     }
   }
   datos=data.frame(datos)
   dat=dat[order(datos[,5]),]
   
   c1=unique(dat$primer_name_original)
   c2=unique(dat$Marker.size)
   
   datt=data.frame(dat,peso=rep(0,nrow(dat)),color=rep(0,nrow(dat)))
   tot=nrow(datt)
   for(i in 1:length(c1))
   {dt1=datt[datt[,2]==c1[i],]
    if(nrow(dt1)!=0)
    {for(j in 1:length(c2))
    {dt2=dt1[dt1[,3]==c2[j],]
     if(nrow(dt2)!=0)
     {#print(dt2[,1:4])
      posi=rownames(dt2)
      ra=nrow(dt2) 
      if(ra< (0.01*tot)){datt[posi,5]=rep(1.5,nrow(dt2));datt[posi,6]=rep(col.fig[1],nrow(dt2))}
      if(ra>= (0.01*tot) & ra< (0.05*tot)){datt[posi,5]=rep(1.2,nrow(dt2));datt[posi,6]=rep(col.fig[2],nrow(dt2))}
      if(ra>= (0.05*tot) & ra< (0.1*tot)){datt[posi,5]=rep(0.9,nrow(dt2));datt[posi,6]=rep(col.fig[3],nrow(dt2))}
      if(ra > (0.1*tot)){datt[posi,5]=rep(0.6,nrow(dt2));datt[posi,6]=rep(col.fig[4],nrow(dt2))}
     } 
    }
    }
   } 
   
   moda=function(x)
   {
     if(is.null(x)) cat(x)
     m1=sort(table(x),decreasing=T)
     moda=names(m1[m1==m1[1]])
     return(moda)
   }
   
   ## Graphic
   
   x <- read.pnm(dir.logo) # reading the logo
   
   clones=unique(datt$CIP.number)
   nameclones1=paste("CIP",unique(datt$CIP.number))
   nameclones=paste(nameclones1,"                          ", sep="")
   
   if(img.format=="jpeg") nameclones2=paste(dir.print,nameclones1,".jpg", sep="")
   if(img.format=="png") nameclones2=file.path(dir.print, paste(nameclones1,".png", sep=""))
   
   for(j in 1:length(clones))
   {
     grup1=datt[datt$CIP.number==clones[j],]
     mrcs=unique(grup1$primer_name_original) 
     
     ## print image 
     if(img.format=="jpeg") jpeg(nameclones2[j],quality = 100,width = res[1], height = res[2],pointsize = 22)
     if(img.format=="png") png(nameclones2[j],width = res[1], height = res[2],pointsize = 22)
     plot(1:length(mrcs),seq(min(grup1$Marker.size), max(grup1$Marker.size), length.out=length(mrcs)),
          type="n",axes=FALSE,ylab=list("Position bp",cex=0.5),xlab=list("Chromosomes/SSR Name                                          ",cex=0.5),
          main=c(paste("Accession number:",nameclones[j]),""," "),
          cex.main=0.8,xlim=c(1,length(mrcs)+7),ylim=ylim)
     
     axis(2,seq(ylim[1],ylim[2],25),lwd=1.2,cex.axis=0.5,las=2, col=col.marg[2])  
     axis(3,at=1:length(mrcs),lab=1:length(mrcs),lwd=1.2,cex.axis=0.5, col=col.marg[3])
     axis(1, col = col.marg[1],at=1:length(mrcs) ,lab=mrcs,lty = 2, lwd = 1.2, cex.axis=0.5, las=2)
     
     
     ##abline(h = seq(ylim[1],ylim[2],25), v = 0, lty = 3, lwd = .1, col = "gray78")
     
     for(i in seq(ylim[1],ylim[2],25))
     {lines(c(1,length(mrcs)),c(i,i),lty=3,lwd=0.8,col="gray80")
     }
     
     
     ## the vertical lines 
     for(i in 1:length(mrcs))
     {pt0=datt[datt$primer_name_original==mrcs[i],]
      lines(c(i,i),c(min(pt0$Marker.size),ylim[2]),lty=1,lwd=2,col="gray90",type = "l")  # line one
      lines(c(i,i),c(min(pt0$Marker.size),max(pt0$Marker.size)),lty=1,lwd=4,col="gray80",type = "l")
     }
     
     cmp="inicio"
     ## printing circles 
     for(i in 1:length(mrcs))
     {
       pt1=grup1[grup1$primer_name_original==mrcs[i],]
       
       if(pt1[1,4]==cmp){lines(c(i-1,i),c(ylim[2],ylim[2]),lty=1,lwd=2,col="gray90",type = "l")}
       
       points(rep(i,nrow(pt1)),pt1[,3],pch=16,col=pt1[,6],cex=pt1[,5])
       rom=moda(pt1[,4])[1]   
       if(nchar(rom)>6){rom="unknw"}
       text(i,(ylim[1]-5),as.factor(rom),cex=0.5)
       
       cmp = rom
     }
     
     
     ## one legend
     legend(length(mrcs)+0.7, ylim[2], c("0% - 1%", "1% - 5%", "5% - 10%","10% - .."), col = c(col.fig[1],col.fig[2],col.fig[3],col.fig[4]),
            text.col = "gray1", lty = c(1,1,1,1), pch = c(16,16,16,16), merge = TRUE,pt.cex=c(1.5,1.2,0.9,0.6),
            cex=0.57,title="Allele frequency     ")
     if(interactive()) cat(paste(j,":\t",nameclones2[j],"\n",sep=""))
     ## two legend
     d1=species.name
     d2=set.name
     d3=date()
     d4=length(mrcs)
     imp=c("Species Name:",d1,"","Set Name:",d2,"","Evaluation Date:",d3,"","Total Genotypes:",d4,"")
     legend(length(mrcs)+0.7,ylim[2]-60,imp,pch="",cex=0.54, title="Description") 
     
     addlogo(x, px=c(length(mrcs)+0.7,length(mrcs)+6.5), py=c(70,125))
     dev.off()
   }
   options(warn=1)
  }

