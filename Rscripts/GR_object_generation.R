Peaks <- read.csv(“DESeq2_results_ATAC-seq.csv”)
Gr_object <- GRanges(seqnames = peaks$seqnames, ranges = IRanges(start = peaks$start, end = peaks$end))
