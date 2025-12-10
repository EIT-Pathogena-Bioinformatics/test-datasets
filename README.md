# test-datasets
A repository for test datasets for EIT Pathogena Technical Applications

___

Making the ont_dummy_dir

```
mkdir ont_dummy_dir

cd ont_dummy_dir

mkdir fastq_pass
mkdir fastq_fail

wget https://github.com/nf-core/test-datasets/raw/bacass/nanopore/A1403KPN.fq.gz

zcat A1403KPN.fq.gz \
  | paste - - - - \
  | head -n 21 \
  | awk '{print > ("read_" NR ".fastq")}'

rm A1403KPN.fq.gz

for f in *.fastq; do gzip $f; done

mkdir {fastq_pass,fast_fail}/barcode01
mkdir {fastq_pass,fast_fail}/barcode03
mkdir {fastq_pass,fast_fail}/barcode03
mkdir {fastq_pass,fast_fail}/unclassified

mkdir fastq_pass/barcode02 # Barcode present in passed but not failed to check error handling
mkdir fastq_fail/barcode04 # Empty dir to check error handling

# Move reads to their new homes
mv read_{1,2,3}.fastq.gz fastq_pass/barcode01
mv read_{4,5,6}.fastq.gz fastq_pass/barcode02
mv read_{7,8,9}.fastq.gz fastq_pass/barcode03
mv read_{10,11,12}.fastq.gz fastq_pass/unclassified/
mv read_{13,14,15}.fastq.gz ont_dummy_dir/fastq_fail/barcode01
mv read_{16,17,18}.fastq.gz ont_dummy_dir/fastq_fail/barcode03
mv read_{19,20,21}.fastq.gz ont_dummy_dir/fastq_fail/unclassified/

# Reformat - all fastq data was on one line
bash process_reads.sh
```
