for R1 in *R1* 
do
	R2=${R1//R1.fastq/R2.fastq}
	R1_paired=${R1//.fastq/_paired.fastq}
	R1_unpaired=${R1//.fastq/_unpaired.fastq}
	R2_paired=${R2//.fastq/_paired.fastq}
	R2_unpaired=${R2//.fastq/_unpaired.fastq}
	trimmomatic PE $R1 $R2 $R1_paired $R1_unpaired $R2_paired $R2_unpaired SLIDINGWINDOW:4:20 MINLEN:25 ILLUMINACLIP:NexteraPE-PE.fa:2:40:15 
done
