#!/usr/bin/env bash
set -euo pipefail

# Safe reproduction of this repository's timestamp idea.
# It creates a NEW nested demo repository and does not rewrite the current repo.

TARGET="${1:-git-time-machine-demo}"

if [[ -e "$TARGET" ]]; then
  echo "Refusing to overwrite existing path: $TARGET" >&2
  exit 1
fi

mkdir -p "$TARGET"
cd "$TARGET"

git init -b main >/dev/null
git config user.name "Synthetic History Demo"
git config user.email "synthetic-history@example.invalid"

cat > README.md <<'EOF'
# Git Time Machine Demo

Synthetic history generated for education and testing.
These dates are metadata and do not represent the real creation date of this repository.
EOF

git add README.md

# Unix epoch: the practical lower boundary used by this demo.
GIT_AUTHOR_DATE='@0 +0000' \
GIT_COMMITTER_DATE='@0 +0000' \
git commit -q -m 'bootstrap: Unix epoch boundary'

for year in $(seq 1971 2026); do
  msg="chronicle: synthetic computing timeline ${year}"

  case "$year" in
    1971) msg='milestone: Intel 4004 starts the microprocessor era' ;;
    1981) msg='milestone: IBM PC pushes personal computing mainstream' ;;
    1991) msg='milestone: the Web opens a new information age' ;;
    2005) msg='milestone: Git changes how software history is recorded' ;;
    2007) msg='milestone: pocket computing enters the smartphone era' ;;
    2022) msg='milestone: generative AI reaches the public' ;;
    2026) msg='milestone: the AI-native era continues' ;;
  esac

  printf '%s\n' "$year — $msg" >> YEARBOOK.txt
  git add YEARBOOK.txt

  GIT_AUTHOR_DATE="${year}-07-01T12:00:00+0000" \
  GIT_COMMITTER_DATE="${year}-07-01T12:00:00+0000" \
  git commit -q -m "$msg"
done

echo
echo "Created: $(pwd)"
echo "Commits: $(git rev-list --count HEAD)"
ROOT=$(git rev-list --max-parents=0 HEAD)
echo "First:   $(git show -s --format='%ad %s' --date=iso "$ROOT")"
echo "Latest:  $(git log -1 --format='%ad %s' --date=iso)"
echo
echo "This is synthetic history. Do not present it as real project chronology."
