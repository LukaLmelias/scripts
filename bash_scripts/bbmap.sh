#! /usr/bin bash

for sample in *R1*
do
	R2=${sample//_R1.fastq.gz/_R1.fastq.gz}
	trimmed=${sample//_R1.fastq.gz/_R1_trimmed.fastq.gz}
	untrimed=${sample//_R1.fastq.gz/_R2_untrimmed.fastq.gz}
	bbduk.sh in=$sample in2=$R2 out=$trimmed out2=$untrimmed qtrim=r trimq=25 qtrim=l trimq=25
done
