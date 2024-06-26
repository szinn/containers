#!/usr/bin/env bash
channel=$1
version=$(curl -sX GET https://api.github.com/repos/rust-lang/rust/releases/latest | jq --raw-output '. | .tag_name'  | head -n1)
version="${version#*v}"
version="${version#*release-}"
printf "%s" "${version}"