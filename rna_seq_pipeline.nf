#!/usr/bin/env nextflow
/*
 * RNA-seq Pipeline Example
 * Author: Narendrareddy Munagala
 * Description:
 *   Demonstrates modular workflow design using Nextflow.
 *   Steps: FASTQ → Alignment → Quantification → Differential Expression.
 *   (All steps are lightweight simulations for illustration.)
 */

params.reads = "data/*.fastq"
params.outdir = "./results"

process ALIGN_READS {
    publishDir "${params.outdir}/aligned", mode: 'copy'

    input:
    file reads from channel.fromPath(params.reads)

    output:
    file "aligned.bam" into aligned_bams

    script:
    """
    echo "Simulating alignment for ${reads}" > alignment.log
    echo "Fake BAM data" > aligned.bam
    """
}

process QUANTIFY_EXPRESSION {
    publishDir "${params.outdir}/counts", mode: 'copy'

    input:
    file bam from aligned_bams

    output:
    file "counts.txt" into count_files

    script:
    """
    echo "Counting features for ${bam}" > count.log
    echo -e "GeneA\t15\nGeneB\t40\nGeneC\t5" > counts.txt
    """
}

process DESEQ2_ANALYSIS {
    publishDir "${params.outdir}/deseq2", mode: 'copy'

    input:
    file counts from count_files.collect()

    output:
    file "deseq2_results.csv"

    script:
    """
    echo "Running dummy DESeq2 analysis..." > deseq2.log
    echo -e "Gene,log2FC,pvalue\nGeneA,1.5,0.01\nGeneB,-2.0,0.03" > deseq2_results.csv
    """
}

workflow {
    ALIGN_READS()
    QUANTIFY_EXPRESSION()
    DESEQ2_ANALYSIS()
}
