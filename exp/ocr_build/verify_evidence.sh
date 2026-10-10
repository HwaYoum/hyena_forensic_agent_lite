#!/bin/bash
# Check that the evidence files match the SHA-1 hashes that ocr and stt look up.
# Usage: bash exp/ocr_build/verify_evidence.sh ~/hyena_ctf
ROOT=${1:?give the evidence folder path (e.g. ~/hyena_ctf)}
INDEX="$(dirname "$0")/ocr_index.tsv"
n=0; bad=0
while IFS=$'\t' read -r kind rel sha _; do
  [ "$kind" = "kind" ] && continue
  n=$((n + 1))
  if [ ! -f "$ROOT/$rel" ]; then echo "missing: $rel"; bad=$((bad + 1)); continue; fi
  [ "$(sha1sum "$ROOT/$rel" | cut -d' ' -f1)" = "$sha" ] || { echo "differs: $rel"; bad=$((bad + 1)); }
done < "$INDEX"
echo "checked $n, mismatched $bad (expected: 2110, 0)"
[ "$bad" -eq 0 ]
