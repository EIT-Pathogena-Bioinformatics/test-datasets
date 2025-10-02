# test-datasets
A repository for test datasets for EIT Pathogena Technical Applications

This branch `reads_and_ref` is test data of reads and a reference genome.
Some reads are from the nf-core test-dataset which may or may not have an
exact match of the reads to the reference.

Use `generate_data/runSRAssembly.sh` to run `SRAssembly` and download
paired reads and assemblies. Then subsample, zip, and move them to
`data/`.

These results are manually listed in `data/samplesheet.csv`.
