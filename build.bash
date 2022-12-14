# Build the ebook. Requires git and pandoc.

# Pre-process foreward template version.
if [[ -n $(git status -s) ]]; then
    COMMIT="#######"
    EPOCH=$(date +%s)
else
    COMMIT=$(git log -1 --format=%h)
    EPOCH=$(git log -1 --format=%ct)
    TAG=$(git describe --tags --candidates=0 $COMMIT 2>/dev/null)
    if [[ -n $TAG ]]; then
        COMMIT=$TAG
    fi
fi
DATE="@$EPOCH"
VERSION="Commit $COMMIT, $(date -d $DATE +'%B %d, %Y')."
sed "s/{{ version }}/$VERSION/g" foreward.tpl.md > foreward.md
echo "${VERSION}"

# Build ebook.
OUTPUT="HoShangKungsCommentaryOnLaotse-$COMMIT.epub"
pandoc \
  --output "${OUTPUT}" \
  --toc \
  --toc-depth 1 \
  --css style.css \
  --verbose \
  meta.yaml \
  foreward.md \
  preface.md \
  introduction.md \
  01.md \
  02.md \
  03.md \
  04.md \
  05.md \
  06.md \
  07.md \
  08.md \
  09.md \
  10.md \
  11.md \
  12.md \
  13.md \
  14.md \
  15.md \
  16.md \
  17.md \
  18.md \
  19.md \
  20.md \
  21.md \
  22.md \
  23.md \
  24.md \
  25.md \
  26.md \
  27.md \
  28.md \
  29.md \
  30.md \
  31.md \
  32.md \
  33.md \
  34.md \
  35.md \
  36.md \
  37.md \
  38.md \
  39.md \
  40.md \
  41.md \
  42.md \
  43.md \
  44.md \
  45.md \
  46.md \
  47.md \
  48.md \
  49.md \
  50.md \
  51.md \
  52.md \
  53.md \
  54.md \
  55.md \
  56.md \
  57.md \
  58.md \
  59.md \
  60.md \
  61.md \
  62.md \
  63.md \
  64.md \
  65.md \
  66.md \
  67.md \
  68.md \
  69.md \
  70.md \
  71.md \
  72.md \
  73.md \
  74.md \
  75.md \
  76.md \
  77.md \
  78.md \
  79.md \
  80.md \
  81.md \
  README.md
echo Built "${OUTPUT}"
