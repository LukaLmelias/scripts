usr/bin/bash

#Generate counts 
mkdir featurescount
gunzip Homo_sapiens.GRCh38.102.gtf.gz
for sample in *_sorted.bam
do
	output=${sample//__hisat_sorted.bam/ }
	
	featureCounts -T 4  -a Homo_sapiens.GRCh38.102.gtf  -g gene_id -o featurescount/$output $sample
done
