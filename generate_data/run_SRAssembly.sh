
# https://github.com/EIT-Pathogena-Bioinformatics/SRAssembly
nextflow run ~/pathogena/technology_applications/SRAssembly/EIT-Pathogena-Bioinformatics-getsrassembly/ \
   -profile docker \
   -c generate_data/SRAssembly.configs \
   -with-tower \
   -resume \
   --input generate_data/SRAssembly_sample_sheet.csv \
   --outdir generate_data/SRAssembly_results


seqtk sample -s100 generate_data/SRAssembly_results/sratools/SRR17117372_1.fastq.gz 10000 | gzip > data/SRR17117372_1_subset.fastq.gz
seqtk sample -s100 generate_data/SRAssembly_results/sratools/SRR17117372_2.fastq.gz 10000 | gzip > data/SRR17117372_2_subset.fastq.gz

seqtk sample -s100 generate_data/SRAssembly_results/sratools/SRR17117371/SRR17117371.fastq 1000 gzip > data/SRR17117371_subsample.fastq
gzip data/SRR17117371_subsample.fastq

cp generate_data/SRAssembly_results/wget/GCF_020736045.1.genomic.fna.gz data