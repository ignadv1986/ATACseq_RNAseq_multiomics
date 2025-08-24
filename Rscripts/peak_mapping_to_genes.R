library(ChIPseeker)
library(TxDb.Hsapiens.UCSC.hg38.knownGene)
txdb <- TxDb.Hsapiens.UCSC.hg38.knownGene
peakAnno <- annotatePeak(Gr_object, TxDb=txdb, tssRegion=c(-2000, 2000), annoDb="org.Hs.eg.db")
# View results
peak_annotated_df <- as.data.frame(peakAnno)
head(peak_annotated_df)
