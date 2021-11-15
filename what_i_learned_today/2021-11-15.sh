cd -- "${0%/*}"

memo_dir="$PWD/memo"
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
# if [ -f "${file}"] then;
#     count=1
#     let count++
#     TEMPLATE>>"${file}_${count}".md
# else
#     TEMPLATE>>"${file}".md
# fi

code "${file}".md



