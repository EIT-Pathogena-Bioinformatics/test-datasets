# Note that long reads and short reads for sample 3 are not from the same sample! Short is from SRA, long is from an internal nanopore run
# Sample 1 - SRR2174160 short read, no long read
# Sample 2 - no short read, 20251015_1609_X2_FBE24607_07507fc0 Barcode01 - long read
# Sample 3 - SRR297282642 short read, 20251015_1609_X2_FBE24607_07507fc0 Barcode02 - long read

cat /mnt/blockvolume/test_data/ont_runs/20251015_1609_X2_FBE24607_07507fc0/fastq_pass/barcode01/*.gz > sample2.fastq.gz
cat /mnt/blockvolume/test_data/ont_runs/20251015_1609_X2_FBE24607_07507fc0/fastq_pass/barcode02/*.gz > sample3.fastq.gz

mamba create -n rasusa -c bioconda rasusa # rasusa=2.2.2

mamba activate rasusa

#Downsample to 10,000,000 bases (~2x coverage) to reduce filesize
for f in *.gz; 
    do rasusa reads -b 10000000 -s 1 ${f} > tmp;
    mv tmp ${f};
done