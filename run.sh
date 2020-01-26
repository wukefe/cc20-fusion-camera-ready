#!/bin/bash
usage(){
    printf '%s\n\n' \
        "$0 <options>" \
        "1) $0 diff     ## build diff.pdf" \
        "2) $0 src      ## extract source code and save to chen-latex-src.zip"
    exit 1
}

build_diff(){
    (cd cc20-draft-review && latexpand paper.tex > ../diff-draft.tex) && \
        latexpand paper.tex > diff-ready.tex && \
        latexdiff diff-draft.tex diff-ready.tex > diff.tex && \
        make diff && echo "Building diff.pdf successfully!!"
}

extract_src(){
    folder="chen-latex-src"
    mkdir -p ${folder}
    ## ${folder} already has Makefile and readme.md
    cp -r paper.tex main.tex common.tex cc20.bib src ACM-Reference-Format.bst acmart.cls ${folder}/
    # tar -czf ${folder}.tar.gz ${folder}
    zip -r ${folder}.zip ${folder}
    echo "${folder}.zip has been created successfully!"
}


if [ $# -eq 1 ]; then
    if [ $1 = "diff" ]; then
        build_diff
    elif [ $1 = "src" ]; then
        extract_src
    else
        usage
    fi
else
    usage
fi


