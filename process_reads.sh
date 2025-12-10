find ont_dummy_dir \
  -type f \( -name "*.fastq.gz" -o -name "*.fq.gz" \) -print0 |
while IFS= read -r -d '' fqgz; do
  echo "Processing: $fqgz"

  # temporary uncompressed and recompressed files
  tmp_unzipped="${fqgz%.gz}.tmp"
  tmp_recompressed="${fqgz}.tmp"

  # 1) unzip and reformat
  gzip -cd "$fqgz" | \
    awk -F'\t' '
      NF==4 {
        # header, seq, plus, qual
        print $1
        print $2
        print $3
        print $4
        next
      }
      NF==3 {
        # header, seq, qual (synthesize + line)
        print $1
        print $2
        print "+"
        print $3
        next
      }
      NF>0 {
        # unexpected format: print as-is for debugging
        print $0 > "/dev/stderr"
      }
    ' > "$tmp_unzipped"

  # 2) ensure file ends with a newline
  sed -i -e '$a\' "$tmp_unzipped"

  # 3) re-gzip to a temp gz
  gzip -c "$tmp_unzipped" > "$tmp_recompressed"

  # 4) move back over original and clean up
  mv "$tmp_recompressed" "$fqgz"
  rm -f "$tmp_unzipped"
done