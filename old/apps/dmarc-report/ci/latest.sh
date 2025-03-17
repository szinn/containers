#!/usr/bin/env bash
version=$(curl -s "https://registry.hub.docker.com/v2/repositories/gutmensch/dmarc-report/tags?ordering=name" | jq --raw-output  '.results[] | select(.name) | .name' | grep -v latest | head -1)

printf "%s" "${version}"
