# Bioinformatics Workflow Code Samples

This repository contains **representative code examples** that reflect my workflow development, automation, and scripting experience in bioinformatics.  
All examples are original and authored by me to illustrate the design principles, coding style, and modular workflow logic I apply in real research and production environments.

Because my actual institutional work was performed on secure university and enterprise systems (IUPUI HPC clusters, internal GitHub Enterprise, and AWS-based pipelines), direct source code and datasets cannot be shared publicly.  
These examples are therefore simplified, self-contained analogs that demonstrate the same structure, logic, and reproducibility practices used in my professional pipelines.

---

## Repository Overview

### **1. RNA-seq Pipeline (`rna_seq_pipeline.nf`)**
A **Nextflow** pipeline illustrating a modular transcriptomics workflow:
- Simulates the stages: *FASTQ → Alignment → Quantification → Differential Expression*
- Demonstrates process chaining, channel communication, and output management
- Implements lightweight “echo” commands to simulate real steps such as STAR alignment, featureCounts quantification, and DESeq2 analysis  
- **Purpose:** Showcase Nextflow DSL2 syntax, reproducibility, and workflow organization  
- **Author:** Recreated individually to reflect my contributions to collaborative workflows (original implementations were part of team projects)

---

### **2. QC Log Parser (`qc_summary_parser.py`)**
A **Python script** that summarizes pipeline QC logs into tabular CSV reports:
- Reads `.log` files from a given directory  
- Extracts completion status and runtime information  
- Outputs a concise summary table for batch-level quality assessment  
- Implements error handling, argument parsing, and `pandas`-based data wrangling  
- **Purpose:** Demonstrate scripting ability, automation logic, and clean code documentation  
- **Author:** Recreated individually to reflect my contributions to collaborative workflows (original implementations were part of team projects)

---

### **3. Variant Calling Workflow (`variant_calling.wdl`)**
A **WDL (Workflow Description Language)** example illustrating variant calling task modularization:
- Defines two tasks: *AlignReads* and *CallVariants*  
- Demonstrates clear I/O handling, runtime specifications, and task composition  
- Simulates a standard short-read variant detection workflow  
- **Purpose:** Showcase reproducible WDL workflow syntax and task orchestration  
- **Author:** Recreated individually to reflect my contributions to collaborative workflows (original implementations were part of team projects)

---

## Design Principles Demonstrated
- **Modularity:** Each workflow is broken into logical, reusable steps  
- **Reproducibility:** Uses container-ready structure and clean input/output definitions  
- **Transparency:** Code is fully documented and easy to follow  
- **Portability:** Scripts are simulation-based and can run safely without datasets  
- **Workflow Familiarity:** Demonstrates understanding of tools such as Nextflow, WDL, Python, and `pandas`

---

## How to Run (Simulated)
Although these examples use placeholder data for safety and portability, they can be executed locally to demonstrate structure:

```bash
# Example for the Python QC parser
mkdir logs
echo "Job completed successfully\nRuntime: 2m 10s" > logs/sampleA.log
python3 qc_summary_parser.py --log_dir logs --output qc_summary.csv
