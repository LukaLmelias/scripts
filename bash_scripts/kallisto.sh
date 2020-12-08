for sample in *R1_paired.fastq.gz*
do
	output= ${sample//_R1_paired.fastq.gz/ }
	R2=${sample//_R1_paired.fastq.gz/_R2_paired.fastq.gz}
	kallisto quant -i ../Kallisto/kallisto_index -b 30 -o ../kallisto_results/$output  ${sample} $R2
done
