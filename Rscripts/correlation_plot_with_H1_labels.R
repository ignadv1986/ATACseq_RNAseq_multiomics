# Step 1: Define Ensembl IDs and corresponding gene names
highlight_genes <- c("ENSG00000187837", "ENSG00000189060", "ENSG00000168298")
gene_labels <- c("H1-2", "H1-0", "H1-4")
names(gene_labels) <- highlight_genes  # named vector for easy lookup

# Step 2: Flag highlighted genes
merged_df$highlight <- ifelse(merged_df$gene %in% highlight_genes, "yes", "no")

# Step 3: Add label column (only for highlighted genes)
merged_df$label <- ifelse(merged_df$gene %in% highlight_genes,
                          gene_labels[merged_df$gene_id],
                          NA)

# Step 4: Plot
ggplot(merged_df, aes(x = ATAC_log2FC, y = log2FoldChange)) +
  geom_point(aes(color = highlight), alpha = 0.6) +
  scale_color_manual(values = c("no" = "gray", "yes" = "red")) +
  geom_text_repel(
    data = subset(merged_df, highlight == "yes"),
    aes(label = label),
    size = 4,
    max.overlaps = 100
  ) +
  theme_minimal() +
  labs(
    x = "ATAC-seq log2 Fold Change",
    y = "RNA-seq log2 Fold Change",
    color = "Highlighted",
    title = "Correlation of ATAC and RNA Fold Changes"
  )
