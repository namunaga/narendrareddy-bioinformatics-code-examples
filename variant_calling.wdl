version 1.0

workflow variant_calling {
    input {
        File fastq1
        File fastq2
        File reference
    }

    call AlignReads {
        input:
            fastq1 = fastq1,
            fastq2 = fastq2,
            reference = reference
    }

    call CallVariants {
        input:
            bam = AlignReads.output_bam,
            reference = reference
    }

    output {
        File vcf = CallVariants.output_vcf
    }
}

task AlignReads {
    input {
        File fastq1
        File fastq2
        File reference
    }

    command <<<
        echo "Simulating alignment for ${fastq1} and ${fastq2}" > alignment.log
        echo "Fake BAM content" > aligned.bam
    >>>

    output {
        File output_bam = "aligned.bam"
    }

    runtime {
        cpu: 2
        memory: "2G"
    }
}

task CallVariants {
    input {
        File bam
        File reference
    }

    command <<<
        echo "Simulating variant calling for ${bam}" > call.log
        echo -e "chr1\t100\tA\tT\tQUAL=99" > variants.vcf
    >>>

    output {
        File output_vcf = "variants.vcf"
    }

    runtime {
        cpu: 2
        memory: "2G"
    }
}
