# Extract GRanges object from peakAnno
peak_gr <- as.GRanges(peakAnno)
# Get gene annotation table
peak_annotated_df <- as.data.frame(peakAnno)
# Now add coordinates to the annotation table
peak_annotated_df$chr <- as.character(seqnames(peak_gr))
peak_annotated_df$start <- start(peak_gr)
peak_annotated_df$end <- end(peak_gr)
# Merge to get the LFC column
library(dplyr)
# Rename for merge compatibility
colnames(peaks)[which(names(peaks) == "seqnames")] <- "chr"
# Merge by chr + start + end
merged_atac <- inner_join(
  peaks,
  peak_annotated_df,
  by = c("chr", "start", "end")
)
# Extract log2FC and gene info
LFC_ATAC_genes <- merged_atac %>%
  select(ENSEMBL, Fold) %>%
  rename(gene = ENSEMBL, ATAC_log2FC = Fold) %>%
  filter(!is.na(gene))
