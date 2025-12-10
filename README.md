# test-datasets
A repository for test datasets for EIT Pathogena Technical Applications

___

Making the ont_dummy_dir

```
mkdir ont_dummy_dir

cd ont_dummy_dir

mkdir fastq_pass
mkdir fastq_fail

# Reformat - all fastq data was on one line
bash ../generate_reads.sh 21

mkdir {fastq_pass,fastq_fail}/barcode01
mkdir {fastq_pass,fastq_fail}/barcode03
mkdir {fastq_pass,fastq_fail}/barcode03
mkdir {fastq_pass,fastq_fail}/unclassified

mkdir fastq_pass/barcode02 # Barcode present in passed but not failed to check error handling
mkdir fastq_fail/barcode04 # Empty dir to check error handling

# Move reads to their new homes
mv read_{1,2,3}.fastq.gz fastq_pass/barcode01
mv read_{4,5,6}.fastq.gz fastq_pass/barcode02
mv read_{7,8,9}.fastq.gz fastq_pass/barcode03
mv read_{10,11,12}.fastq.gz fastq_pass/unclassified/
mv read_{13,14,15}.fastq.gz fastq_fail/barcode01
mv read_{16,17,18}.fastq.gz fastq_fail/barcode03
mv read_{19,20,21}.fastq.gz fastq_fail/unclassified

cd ..

tar -cvf ont_dummy_dir.tar ont_dummy_dir/
```
