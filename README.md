# ATACseq_RNAseq_multiomics
Integrated analysis of ATAC-seq and RNA-seq data from U2OS wild-type and CRAMP1 knockout cells to investigate the transcriptional and chromatin accessibility changes associated with CRAMP1 loss.
## Project Summary
This repository covers the merging of data obtained from ATAC-seq and RNA-seq experiments performed on human osterosarcoma U2OS cells, both wild-type (WT) and CRAMP1 knock-out (KO). The pipelines used to generate these datasets can be found in [this](https://github.com/ignadv1986/ATAC-Seq-analysis-with-DiffBind-DESeq2) and [this](https://github.com/ignadv1986/RNA-Seq-Analysis-with-DESeq2-Bioconductor) links, respectively. It includes the full bioinformatic pipeline, as well as the generated graphs and an interpretation of the results.
## Background
Previous experiments generated in our laboratory suggested that CRAMP1 could be acting as a regulator of histone expression. To test this theory, we performed RNA-seq experiments and observed that, while CRAMP1 does not broadly affect histone expression, its knockout leads to a decrease in the levels of most histone H1 isoforms, revealing CRAMP1 as a novel H1-specific transcription factor.
It has been reported that a decrease on H1 levels leads to a reduced overall chromatin compaction. To test if, through its role controlling H1 levels, CRAMP1 had the same effect, chromatin compaction was assessed through ATAC-seq. CRAMP1-KO cells indeed showed a reduction in overall chromatin compaction, but this effect was very modest, likely due to H1 isoforms levels being reduced to only about 50% in these conditions.
Experimental procedures for the above mentioned experiments can be found in [this publication](https://www.sciencedirect.com/science/article/pii/S1097276525003090?via%3Dihub#sec8)
## Aim of the study
This repository evaluates the correlation between chromatin accesibility and gene expression - assessed by ATAC-seq and RNA-seq, respectively - in CRAMP1-KO compared to WT cells.
The specific purpose of such workflow is to determine if H1 levels could be lowered in CRAMP1-KO cells due to differences in chromatin accesibility at those genes, which would challenge the hypothesis that CRAMP1 is an H1-specific transcription regulator.
## Tools
- **R/Bioconductor Packages:**
  - GenomeRanges: Genomic interval handling.
  - ChIPSeeker: Mapping to genomic regions.
  - dplyr: Data manipulation.
  - ggplot: Data visualization.
## Workflow
1) Generation of a **GenomicRanges** objects from DiifBind/DESeq2-generated ATAC-seq data.
2) Assignment of peaks to their respective genes with **ChIPSeeker**.
3) Merging with RNA-seq data.
4) Plotting and visualization.
## Results
- Although CRAMP1 knockout cells exhibited slightly increased chromatin accessibility at a subset of genomic regions, the overall transcriptional output remained largely unchanged [Figure 1](./graphs/ATAC_vs_RNA-seq_FC.pdf), [Figure 2](./graphs/Average_RNA_change_per_ATAC_accesibility_bin.pdf). This weak correlation between chromatin accessibility and gene expression (r = 0.28) likely reflects the subtlety of chromatin remodeling events, and suggests that CRAMP1 loss does not induce major transcriptional rewiring, but rather controls the expression of specific genes. The mild nature of these chromatin changes may also explain the phenotypic similarity between CRAMP1 KO and WT U2OS cells.
- H1 isoforms were absent from the graph correlating ATAC and RNA-seq. Because the ATAC-seq dataset was filtered for regions with significantly altered chromatin accesibility, strongly suggesting that CRAMP1-mediated H1 regulation is not driven by local chromatin accessibility changes.
- We observed that the majority of differentially accessible regions in CRAMP1 knockout cells fell within a mild accessibility range (log2FC between 0.5 and 1). These regions were associated with a small but consistent increase in gene expression [Figure 3](./graphs/ATAC_vs_RNA-Seq_peak_count.pdf). This pattern suggests that subtle chromatin opening - likely caused by the reduction in H1 levels - while not dramatic, may still contribute to fine-tuned transcriptional regulation. The overall distribution supports a model where H1 partial depletion due to CRAMP1 loss induces modest chromatin remodeling without triggering large-scale transcriptional reprogramming.
