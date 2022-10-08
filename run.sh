set -e
if [[ ! $1 ]]; then
    echo "$0" MARKDOWN_FILE
    exit 1
fi
(set -x && hash pandoc)
(set -x && hash firefox)
scriptDir="$(cd "$(dirname $(readlink -f "${BASH_SOURCE[0]}"))" && pwd)"
cd "$scriptDir"
(set -x && pandoc --css=style.css "$1" -f markdown -t html -s -o resume.html)
echo -e 'firefox resume.html #\033[1m\033[38;2;255;255;255m open resume.html in firefox and press ctl+p to print to pdf\033[0m'
# [[ -f ~/Downloads/resume.pdf ]] && firefox ~/Downloads/resume.pdf
