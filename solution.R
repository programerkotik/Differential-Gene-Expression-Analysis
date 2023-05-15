library(DESeq2)
library(pheatmap)

# Load count matrix
x <- read.table("data/sample.counts", row.names = 1, header = TRUE, sep = ",")
s <- read.table("data/sample.info", header = TRUE, row.names = 1, colClasses = c("character", "factor"))

# Create DESeq2 object
dds <- DESeqDataSetFromMatrix(countData = x, colData = s, design = ~ condition)

# Run a differential expression analysis (Tumour vs. Normal) using a log-fold change threshold of 1
dds <- DESeq(dds)
res <- results(dds, lfcThreshold = 1)

# Generate an MA-plot and save as "ma_plot.png"
png("res/ma_plot.png")
plotMA(res, ylim = c(-8, 8))
dev.off()

# Plot the normalized counts for the GJB2 gene and save as "plot_counts.png"
png("res/plot_counts.png")
plotCounts(dds, gene = "GJB2", intgroup = "condition")
dev.off()

# Generate a PCA plot of the samples using the transformed count data and save as "pca_plot.png"
vsd <- vst(dds, blind = FALSE)
png("res/pca_plot.png")
plotPCA(vsd, intgroup = c("condition"))
dev.off()

# Visualize the differential gene expression results as a heatmap and save as "heatmap.png"
select <- order(rowMeans(counts(dds, normalized = TRUE)), decreasing = TRUE)[1:20]
df <- as.data.frame(colData(dds)[, c("condition")])
png("res/heatmap.png")
pheatmap(assay(vsd)[select, ], cluster_rows = TRUE, show_rownames = TRUE, cluster_cols = TRUE)
dev.off()

# Export the significant results (padj < 0.01) to a CSV file
resSig <- subset(res, padj < 0.01)
write.csv(as.data.frame(resSig), file = "res/results.csv")
