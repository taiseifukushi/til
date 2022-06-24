memo_dir="$PWD"
mkdir -p "${memo_dir}"
today="$(date +%Y-%m-%d)"
file="${memo_dir}/${today}"
TEMPLATE=`cat <<EOS >>"${file}".md
# "${today}"
## やること
## 疑問点
## メモ
EOS
`
TEMPLATE>>"${file}".md

code "${file}".md



