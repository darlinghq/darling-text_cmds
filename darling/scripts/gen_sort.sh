SRCROOT="$(cd ../.. && pwd)"
DSTROOT="$SRCROOT/sort/gen"

mkdir -p "$DSTROOT"

# Based off of xcodescripts/install-sort-man.sh
sed -e 's|^%%THREADS%%||' -e 's|^%%NLS%%|\.\\"|' < ${SRCROOT}/sort/sort.1.in > ${DSTROOT}/sort.1