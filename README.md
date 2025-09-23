# MPRA Data Preprocessing and Analysis Results

This repository contains the preprocessing workflow and analysis results for MPRA (Massively Parallel Reporter Assay) data.

## Contents

### Main Analysis
- **`data_preprocessing.ipynb`** - Comprehensive Jupyter notebook containing:
  - R1/R2 sequencing data quality control and trimming
  - Oligo library duplicate detection and curation
  - Detailed preprocessing workflow with explanations

### Configuration
- **`config_assignment.yaml`** - Configuration file for MPRA assignment workflow

### Analysis Results
- **`results/assignment/assignMPRAworkshop/statistic/`**
  - `assignment.default.png` - Assignment statistics visualization
  - `assigned_counts.default.tsv` - Assigned barcode counts
  - `total_counts.tsv` - Total count statistics
  - `assignment/bam_stats.txt` - BAM alignment statistics

## Workflow Overview

1. **Sequencing Data Processing**
   - R1 barcode length analysis and trimming
   - R2 adapter identification and removal
   - Paired-end read synchronization

2. **Oligo Library Curation**
   - Duplicate ID detection and resolution
   - Sequence-based deduplication
   - Quality control validation

## Usage

Open `data_preprocessing.ipynb` in Jupyter to see the complete analysis workflow with detailed explanations and results.

## Generated Files

The notebook generates processed FASTQ files and curated FASTA libraries ready for downstream MPRA analysis.