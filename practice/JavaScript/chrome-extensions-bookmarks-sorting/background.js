// インストール時に実行し、`chrome.storage`に保存する
chrome.runtime.onInstalled.addListener(() => {
	chrome.bookmarks.getTree().then((res) => {
		console.log(res[0]["children"][0]["children"]);
		console.log(res[0]["children"][0]["children"].length);
		let setNodes = res[0]["children"][0]["children"].length;
		chrome.storage.sync.set({ _k: setNodes });
	});
});

// ブックマークをすべて取得する
function getTreeNodes() {
	chrome.bookmarks.getTree();
}
