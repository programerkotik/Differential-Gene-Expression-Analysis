# DESeq2 Analysis

This repository contains an R script for performing a gene expression analysis using DESeq2, a popular Bioconductor package for differential gene expression analysis. DESeq2 is widely used in RNA-seq data analysis to identify differentially expressed genes between different conditions or groups.

## Dependencies

To run the script, you need to have the following R packages installed:

- DESeq2
- pheatmap

Make sure you have these packages installed before running the script.

## Usage

1. Clone the repository or download the R script directly.

2. Prepare your input files:
   - `sample.counts`: This file should contain the count matrix with gene expression values. The rows represent genes, and the columns represent samples.
   - `sample.info`: This file should contain sample metadata, including information about the conditions or groups.

3. Update the file paths in the script:
   - Modify the file paths in the `read.table()` function calls to point to your actual input files.

4. Run the script:
   - Execute the script in your preferred R environment (e.g., RStudio) or via the command line.
   - The script will perform the following steps:
     - Load the count matrix and sample information.
     - Create a DESeq2 object.
     - Perform differential expression analysis.
     - Generate various plots, including an MA-plot, a plot of normalized counts, a PCA plot, and a heatmap.
     - Export the significant results to a CSV file.

5. The resulting plots will be saved as PNG files in the same directory as the script:
   - `ma_plot.png`: MA-plot showing the differential expression results.
   - `plot_counts.png`: Normalized counts plot for the GJB2 gene.
   - `pca_plot.png`: PCA plot of the samples.
   - `heatmap.png`: Heatmap visualization of differential gene expression results.

## References

- [DESeq2 Bioconductor package](https://bioconductor.org/packages/release/bioc/html/DESeq2.html): Official documentation and resources for DESeq2.
