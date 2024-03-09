#!/usr/bin/bash



function Creat_dir() {
    declare dir_path=$1
    declare file_ext=$2

    if [[ "${file_ext}" == "txt" || "${file_ext}" == "pdf" || "${file_ext}" == "jpg" ]] && [[ ! -d "$dir_path"/"$file_ext" ]]; then
 
        mkdir "$dpath"/"$ext"
    
    elif [ ! -d "$dpath"/"misc" ]; then

        mkdir "$dpath"/"misc"

    fi
}

function Move_file () {
    declare dir_path=$1
    declare file_name=$2
    declare file_ext=$3

    if [[ "${file_ext}" == "txt" || "${file_ext}" == "pdf" || "${file_ext}" == "jpg" ]]; then
 
        mv "$dir_path"/"$file_name" "$dir_path"/"$file_ext"
    
    else

        mv "$dpath"/"$fname" "$dpath"/misc

    fi
}

main() {
    declare dpath
    declare fname
    declare ext

    dpath="$1"
   
    for fname in `find "$dpath"/* -type f`; do
        
        fname=$(basename -- "$fname")
        ext="${fname##*.}"

        Creat_dir "$dpath" "$ext"

        Move_file "$dpath" "$fname" "$ext"

    done
         
}


main "$1"


