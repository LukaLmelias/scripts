#! usr/bin/bash

#unzip the file to be indexed


gunzip Homo_sapiens.GRCh38.cdna.abinitio.fa.gz


#Building index file

hisat2-build -f  Homo_sapiens.GRCh38.cdna.abinitio.fa ./hisat_idex/Homo_sapiens.GRCh38.cdna.abinitio.idx


# Run hisat2 allignment

for R1 in *R1_paired.fastq.gz*
do

m2=${R1//R1_paired.fastq.gz/R2_paired.fastq.gz}
hisat_output=${R1//R1_paired.fastq.gz/_hisat.sam}

hisat2 -x hisat_index/Homo_sapiens.GRCh38.cdna.abinitio.idx -q -1 $R1 -2 $m2 -s $hisat_output


# convert to binary, sort and index

samtools view -b  $hisat_output | samtools sort  > ${hisat_output//_hisat.sam/_hisat_sorted.bam} 
samtools index ${hisat_output//_hisat.sam/_hisat_sorted.bam} -o ${hisat_output//_hisat.sam/_index}

#delete .sam
rm ${R1//R1_paired.fastq.gz/_hisat.sam}

done
