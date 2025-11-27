# test-datasets
A repository for test datasets for EIT Pathogena Technical Applications

___

Making the ont_dummy_dir

```
mkdir ont_dummy_dir

cd ont_dummy dir

mkdir fastq_pass

cd fastq_pass

wget https://github.com/nf-core/test-datasets/raw/bacass/nanopore/A1403KPN.fq.gz

zcat A1403KPN.fq.gz \
  | paste - - - - \
  | head -n 10 \
  | awk '{print > ("read_" NR ".fastq")}'

for f in *.gz; do gzip $f; done

mkdir barcode01

mv *.gz barcode01

cp -r barcode01 barcode02
cp -r barcode01 barcode03
cp -r barcode01 barcode04
cp -r barcode01 barcode05
cp -r barcode01 barcode06
cp -r barcode01 barcode07
cp -r barcode01 barcode08
cp -r barcode01 barcode09
cp -r barcode01 barcode10
cp -r barcode01 unclassified

cd ..

cp -r fastq_pass/ fastq_fail

# Remove some barcode dirs for robustness checking
rm -rf fastq_fail/barcode02
rm -rf fastq_fail/barcode07

# add some barcode dirs for robustness checking
cp -r fastq_fail/barcode01 fastq_fail/barcode11
```
