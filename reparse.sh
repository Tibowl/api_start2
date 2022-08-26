#!/bin/bash

# for i in {1..115}; do 
    rm parsed/*
    mkdir parsed
    node ../JSFormatter/beautify.js start2.json start2o.json
    git add -u :/
    git add */*
    git commit --amend --no-edit
    git rebase --continue
# done