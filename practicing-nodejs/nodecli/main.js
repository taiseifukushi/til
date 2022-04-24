const program = require("commander");
const fs = require("fs");
// markedモジュールをmarkedオブジェクトとしてインポートする
const marked = require("marked");

program.parse(process.argv);
const filePath = program.args[0];

console.log("program.args[0]", program.args[0])
console.log("program.args[1]", program.args[1])

fs.readFile(filePath, { encoding: "utf8" }, (err, file) => {
    if (err) {
        console.error(err.message);
        process.exit(1);
        return;
    }
    // process.exit(1);
    // MarkdownファイルをHTML文字列に変換する
    const html = marked.parse(file);
    console.log(html);
    // return;
});