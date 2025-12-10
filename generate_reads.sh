if [[ $# -lt 1 ]]; then
  echo "Usage: $0 N [SEED] [OUTDIR]" >&2
  exit 1
fi

N="$1"
SEED="${2:-42}"        # default seed = 42 if not provided
OUTDIR="${3:-.}"       # default output directory = current directory

mkdir -p "$OUTDIR"

python3 - "$N" "$SEED" "$OUTDIR" << 'PY'
import sys, random, os, gzip

N = int(sys.argv[1])
SEED = int(sys.argv[2])
outdir = sys.argv[3]

random.seed(SEED)

bases = "ACGT"

for i in range(1, N + 1):
    # 10 random bases
    seq = ''.join(random.choice(bases) for _ in range(10))
    # 10 quality chars (Phred+33, "I" = high quality)
    qual = 'I' * 10

    header = f"@1:{i}"
    fname = os.path.join(outdir, f"read_{i}.fastq.gz")

    with gzip.open(fname, "wt", newline="\n") as fh:
        fh.write(f"{header}\n")
        fh.write(f"{seq}\n")
        fh.write("+\n")
        fh.write(f"{qual}\n")
PY