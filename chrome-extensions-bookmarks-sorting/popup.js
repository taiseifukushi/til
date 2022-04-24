// document.addEventListener("DOMContentLoaded", function () {
// 	console.log("`sorting.js:`, `DOMContentLoaded`");
// });

// ==========

let get_button = document.getElementById("getBtn");
let sync_button = document.getElementById("syncBtn");
let sort_button = document.getElementById("sortBtn");
let delete_button = document.getElementById("deleteBtn");

get_button.addEventListener("click", () => {
	insertNodesGet();
});

sync_button.addEventListener("click", () => {
	insertNodesSync();
});

sort_button.addEventListener("click", () => {
	console.log("sortBtnが押されました");
});

delete_button.addEventListener("click", () => {
	document.getElementById("list2").textContent = "";
});

// ==========
// 要素を挿入する(テスト)
function insertNodesGet() {
	const list1 = document.getElementById("list1");
	list1.insertAdjacentHTML("beforeend", "<li>insertNodesGet()</li>");
}

// 要素を挿入する(テスト)
function insertNodesSync() {
	const list2 = document.getElementById("list2");
	// const v = dumpTreeNodes();
	chrome.bookmarks.getTree().then((result) => {
		console.log(result);
		// let s = result[0]["children"][0]["children"];
		let s = result[0]["children"][0]["children"].map((value) => {
			// alert(value);
			return value["url"];
		});
		for (var i = 0; i < s.length; i++) {
			list2.insertAdjacentHTML("beforeend", `<li>${s}</li>`);
		}
	});
	// const v = pullStorage();
}

//

// function test() {
// 	chrome.bookmarks.getTree();
// }

// Storageから取り出す(テスト)
// function pullStorage() {
// 	chrome.storage.sync.get("k", (result) => {
// 		console.log("Value currently is " + result);
// 		dumpTreeNodes(result);
// 	});
// }

// chrome.storage.sync.get(["key"], function (result) {
// 	console.log("Value currently is " + result.key);
// });

// // localStorageに保存する(テスト)
// function intoLocalStorage() {
// 	let s = localStorage.setItem(getTreeNodes());
// 	let s2 = localStorage.setItem({ key: "value" });
// 	console.log(s);
// 	console.log(s2);
// }

// ==========
// 取得したブックマーク(bookmarkNodes)から、必要なものだけdumpして取り出す
// function dumpTreeNodes(treeNode) {
// 	// treeNode.map((_v) => {
// 	// 	console.log(_v);
// 	// });
// 	console.log(treeNode);
// 	alert(treeNode);
// 	return treeNode;
// }

// dumpして取り出したブックマークをポップアップ(HTML)に埋め込む

// sortする関数

// sortボタンのイベントリスナー
