#!/bin/bash

QUE=$(echo "$@" | tr ' ' '+')
arxiv_url="https://arxiv.org/search/?query=$QUE&searchtype=all&source=header"

curl -s -L -A Lynx "$arxiv_url" | 
tr -d '\n' | 
tr ' ' '\n' | 
grep -oP 'arXiv:[^<&?]+' |
tr -d 'arXiv:' |
sort | uniq