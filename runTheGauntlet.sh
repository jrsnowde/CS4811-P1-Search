#!/bin/bash

## This is just a simple script to call pacman on every single layout. 
## You can provide all of the other params to this, and it will just 
## loop through the '/layouts' directory and append the '--layout <file>'
## to each subsequent file

paths=()
layouts=()

## List of Agents to test with:
agents=(
    "GoWestAgent"
)
## NOTE: Add each agent to the above list when they get completed

### Parses the root directory (of wherever this function gets called..) in search of files with
### a given extension format, returns the full directory paths
function findFiles() {
    FILE_EXT=$1
    files=()

    # Archaeic implementation of globstar; differences in supported bash versions between mac and linux adds
    # unneccesary overhead when having to install modules and version check
    while IFS= read -r -d $'\0'; do
        files+=("$REPLY")
    done < <(find . -name "${FILE_EXT}" -print0)
    
    # Purge dir name so we can remove duplicate parent directory paths
    for file in "${files[@]}" ; do echo "${file}" ; done
}

## This function reads all routes from the files in './routes' and adds them to a bulk group
function scrapeLayouts {
    echo "Scraping for layouts..."
    echo '============================================='

    # Read and clean an array of directories that have files ending in '.routes.js'
    IFS=' ' read -ra paths <<< "$(findFiles "*.lay" | sort -u | tr '\n' ' ' )"

    for path in "${paths[@]% }"; do
        path="${path% }"    # Remove trailing ' ' character
        layout="$( echo "${path}" | cut -d"/" -f3 | cut -d"." -f1 )"
        layouts+=("${layout}")
        echo "==> Found Layout: '${layout}'"
    done

    echo '============================================='
}

scrapeLayouts ## Driver code to open all layouts in '/layout' dir with the '.lay' extension
for agent in "${agents[@]% }"; do
    echo "Attempting Gauntlet with ${agent}..."
    echo '============================================='
    for layout in "${layouts[@]% }"; do
        conda init zsh | python ./pacman.py -l ${layout} --pacman ${agent}
    done
done
echo '============================================='
echo "DONE!"