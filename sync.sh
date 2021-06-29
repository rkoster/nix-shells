#!/bin/bash

for file in $(find ~/workspace -maxdepth 2 -name shell.nix -type file); do
    pushd $(dirname ${file})
    dir=$(git remote -v | xargs | grep fetch | cut -d' ' -f2 | cut -d'/' -f3- | sed 's/.git//g')
    popd

    if [ -z "${dir}" ]; then
	continue
    fi

    mkdir -p ${dir}
    cp ${file} ${dir}

    pushd $(dirname ${file})
    mv shell.nix{,.back}
    ln -s /Users/rubenk/.config/nix-shells/${dir}/shell.nix
    popd
done
