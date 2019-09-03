#!/bin/bash
set -e

now=$(date +%Y-%m-%d)

if [ "$#" -ne 1 ]
then
  echo "Usage: $0 fichier_markdown_draft"
  echo "exemple: mon_draft.md"
  ls -l _drafts
  exit 1
fi

git mv "_drafts/$1" "_posts/${now}-$1"

git commit -am"--------->>> publication $1  <<<-------------"

