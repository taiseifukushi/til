# SECCON CTF 2022予選

https://zenn.dev/oboenikui/articles/bd0cc264a68cf0
を読む

まったくわからなかった。
せめてwriteupの記事を読んでどんなことをしているか眺める。

# memo

## easylfi

https://zenn.dev/oboenikui/articles/bd0cc264a68cf0#easylfi

>URLのパス部分からファイルを取得しているため、パストラバーサル攻撃ができます。

パストラバーサル攻撃とは

パストラバーサル
>外部からの入力によりパス名を作成し、制限された親ディレクトリ配下に位置するファイルやディレクトリを識別するために用いるようなソフトウェアにおいて、パス名に含まれる特殊な要素の無効化が適切に行われない場合、制限されたディレクトリの外側のパス名解決が可能です。
https://jvndb.jvn.jp/ja/cwe/CWE-22.html

curl `--path-as-is`オプション

>Webアプリケーションファイアウォールなどのテストでディレクトリトラバーサルのテストを行う際、手っ取り早くcurlで攻撃を行いたいことがある。ただ、そのまま「../../」といったパスを指定しても省略されてしまい、うまく攻撃してくれない。そんなときは、curlにオプションとして「--path-as-is」を付与することで対応が可能になる。

https://orebibou.com/ja/home/201612/20161213_001/
https://init6.blog.fc2.com/blog-entry-103.html

```sh
curl --path-as-is http://対象サーバのURL/../../../../etc/passwd
```

curl
>You can specify multiple URLs or parts of URLs by writing part sets within braces and quoting the URL as in:
"http://site.{one,two,three}.com"

https://man7.org/linux/man-pages/man1/curl.1.html

`{}`を使うことで、複数のURLを指定できる

試してみる

```sh
curl "{https://www.google.com/,http://abehiroshi.la.coocan.jp/}"
```

いいかんじに取れた

<details>

```html
<!doctype html><html itemscope="" itemtype="http://schema.org/WebPage" lang="ja"><head><meta content="&#19990;&#30028;&#20013;&#12398;&#12354;&#12425;&#12422;&#12427;&#24773;&#22577;&#12434;&#26908;&#32034;&#12377;&#12427;&#12383;&#12417;&#12398;&#12484;&#12540;&#12523;&#12434;&#25552;&#20379;&#12375;&#12390;&#12356;&#12414;&#12377;&#12290;&#12373;&#12414;&#12374;&#12414;&#12394;&#26908;&#32034;&#27231;&#33021;&#12434;&#27963;&#29992;&#12375;&#12390;&#12289;&#12362;&#25506;&#12375;&#12398;&#24773;&#22577;&#12434;&#35211;&#12388;&#12369;&#12390;&#12367;&#12384;&#12373;&#12356;&#12290;" name="description"><meta content="noodp" name="robots"><meta content="text/html; charset=UTF-8" http-equiv="Content-Type"><meta content="/images/branding/googleg/1x/googleg_standard_color_128dp.png" itemprop="image"><title>Google</title><script nonce="64roBvn9KnMlhLbNBN3o5w">(function(){window.google={kEI:'jReGY5PyFLLj2roPr6y4oAk',kEXPI:'0,18167,1341242,6059,206,2414,2390,2316,383,246,5,5367,1123753,1197722,679,302561,77528,16115,28684,22431,1361,12311,2824,14764,4998,13228,3847,10622,22741,2372,2709,889,704,1279,2742,149,1103,840,6297,4120,2023,2297,14670,3229,2843,8,24989,7126,1654,1851,6398,9358,3,346,230,6459,149,13975,4,1528,2304,27348,7422,7356,13659,4437,16786,5827,2530,4094,17,4035,3,3541,1,42154,2,14022,6249,19490,5679,1021,2380,28741,4568,6259,23418,1252,5835,14968,4332,7484,445,2,2,1,7171,3785,13670,2006,8155,7381,15970,872,19634,7,1922,5784,3995,12414,9365,9543,4832,15759,10744,5797,7,3077,2932,8324,14,82,950,2940,751,2070,12074,1421,1622,781,998,1855,1996,914,205,6,1747,2039,5123,81,246,1003,4652,1741,814,1542,551,276,1450,41,84,1417,568,399,514,5,70,2095,354,86,922,450,473,110,36,6,291,4318,401,68,33,788,140,3,785,2,1425,1340,59,649,6,3,3,577,1,770,65,347,1,77,216,511,1332,14,89,891,56,556,4,6,22,269,311,1456,719,951,67,168,9,33,29,3,499,39,937,131,82,25,1244,80,123,1223,173,56,237,339,281,166,189,622,280,497,678,259,85,108,3,18,176,72,324,36,249,5,49,123,6,72,125,83,306,54,3,147,856,12,34,233,180,123,46,366,21,21,130,471,411,1,1667,1120,378,2257,5285996,5844,86,15,83,14,52,8799029,3311,141,795,19735,1,1,346,2759,41,170,136,20727358,3220020,488,43,4041612,1964,3094,2321,11257,3102,304,11363,2604,10,596,1526098',kBL:'-1VY'};google.sn='webhp';google.kHL='ja';})();(function(){
var f=this||self;var h,k=[];function l(a){for(var b;a&&(!a.getAttribute||!(b=a.getAttribute("eid")));)a=a.parentNode;return b||h}function m(a){for(var b=null;a&&(!a.getAttribute||!(b=a.getAttribute("leid")));)a=a.parentNode;return b}
function n(a,b,c,d,g){var e="";c||-1!==b.search("&ei=")||(e="&ei="+l(d),-1===b.search("&lei=")&&(d=m(d))&&(e+="&lei="+d));d="";!c&&f._cshid&&-1===b.search("&cshid=")&&"slh"!==a&&(d="&cshid="+f._cshid);c=c||"/"+(g||"gen_204")+"?atyp=i&ct="+a+"&cad="+b+e+"&zx="+Date.now()+d;/^http:/i.test(c)&&"https:"===window.location.protocol&&(google.ml&&google.ml(Error("a"),!1,{src:c,glmm:1}),c="");return c};h=google.kEI;google.getEI=l;google.getLEI=m;google.ml=function(){return null};google.log=function(a,b,c,d,g){if(c=n(a,b,c,d,g)){a=new Image;var e=k.length;k[e]=a;a.onerror=a.onload=a.onabort=function(){delete k[e]};a.src=c}};google.logUrl=n;}).call(this);(function(){google.y={};google.sy=[];google.x=function(a,b){if(a)var c=a.id;else{do c=Math.random();while(google.y[c])}google.y[c]=[a,b];return!1};google.sx=function(a){google.sy.push(a)};google.lm=[];google.plm=function(a){google.lm.push.apply(google.lm,a)};google.lq=[];google.load=function(a,b,c){google.lq.push([[a],b,c])};google.loadAll=function(a,b){google.lq.push([a,b])};google.bx=!1;google.lx=function(){};}).call(this);google.f={};(function(){
document.documentElement.addEventListener("submit",function(b){var a;if(a=b.target){var c=a.getAttribute("data-submitfalse");a="1"===c||"q"===c&&!a.elements.q.value?!0:!1}else a=!1;a&&(b.preventDefault(),b.stopPropagation())},!0);document.documentElement.addEventListener("click",function(b){var a;a:{for(a=b.target;a&&a!==document.documentElement;a=a.parentElement)if("A"===a.tagName){a="1"===a.getAttribute("data-nohref");break a}a=!1}a&&b.preventDefault()},!0);}).call(this);</script><style>#gbar,#guser{font-size:13px;padding-top:1px !important;}#gbar{height:22px}#guser{padding-bottom:7px !important;text-align:right}.gbh,.gbd{border-top:1px solid #c9d7f1;font-size:1px}.gbh{height:0;position:absolute;top:24px;width:100%}@media all{.gb1{height:22px;margin-right:.5em;vertical-align:top}#gbar{float:left}}a.gb1,a.gb4{text-decoration:underline !important}a.gb1,a.gb4{color:#00c !important}.gbi .gb4{color:#dd8e27 !important}.gbf .gb4{color:#900 !important}
</style><style>body,td,a,p,.h{font-family:arial,sans-serif}body{margin:0;overflow-y:scroll}#gog{padding:3px 8px 0}td{line-height:.8em}.gac_m td{line-height:17px}form{margin-bottom:20px}.h{color:#1558d6}em{font-weight:bold;font-style:normal}.lst{height:25px;width:496px}.gsfi,.lst{font:18px arial,sans-serif}.gsfs{font:17px arial,sans-serif}.ds{display:inline-box;display:inline-block;margin:3px 0 4px;margin-left:4px}input{font-family:inherit}body{background:#fff;color:#000}a{color:#4b11a8;text-decoration:none}a:hover,a:active{text-decoration:underline}.fl a{color:#1558d6}a:visited{color:#4b11a8}.sblc{padding-top:5px}.sblc a{display:block;margin:2px 0;margin-left:13px;font-size:11px}.lsbb{background:#f8f9fa;border:solid 1px;border-color:#dadce0 #70757a #70757a #dadce0;height:30px}.lsbb{display:block}#WqQANb a{display:inline-block;margin:0 12px}.lsb{background:url(/images/nav_logo229.png) 0 -261px repeat-x;border:none;color:#000;cursor:pointer;height:30px;margin:0;outline:0;font:15px arial,sans-serif;vertical-align:top}.lsb:active{background:#dadce0}.lst:focus{outline:none}</style><script nonce="64roBvn9KnMlhLbNBN3o5w">(function(){window.google.erd={jsr:1,bv:1693,de:true};
var h=this||self;var k,l=null!=(k=h.mei)?k:1,n,p=null!=(n=h.sdo)?n:!0,q=0,r,t=google.erd,v=t.jsr;google.ml=function(a,b,d,m,e){e=void 0===e?2:e;b&&(r=a&&a.message);if(google.dl)return google.dl(a,e,d),null;if(0>v){window.console&&console.error(a,d);if(-2===v)throw a;b=!1}else b=!a||!a.message||"Error loading script"===a.message||q>=l&&!m?!1:!0;if(!b)return null;q++;d=d||{};b=encodeURIComponent;var c="/gen_204?atyp=i&ei="+b(google.kEI);google.kEXPI&&(c+="&jexpid="+b(google.kEXPI));c+="&srcpg="+b(google.sn)+"&jsr="+b(t.jsr)+"&bver="+b(t.bv);var f=a.lineNumber;void 0!==f&&(c+="&line="+f);var g=
a.fileName;g&&(0<g.indexOf("-extension:/")&&(e=3),c+="&script="+b(g),f&&g===window.location.href&&(f=document.documentElement.outerHTML.split("\n")[f],c+="&cad="+b(f?f.substring(0,300):"No script found.")));c+="&jsel="+e;for(var u in d)c+="&",c+=b(u),c+="=",c+=b(d[u]);c=c+"&emsg="+b(a.name+": "+a.message);c=c+"&jsst="+b(a.stack||"N/A");12288<=c.length&&(c=c.substr(0,12288));a=c;m||google.log(0,"",a);return a};window.onerror=function(a,b,d,m,e){r!==a&&(a=e instanceof Error?e:Error(a),void 0===d||"lineNumber"in a||(a.lineNumber=d),void 0===b||"fileName"in a||(a.fileName=b),google.ml(a,!1,void 0,!1,"SyntaxError"===a.name||"SyntaxError"===a.message.substring(0,11)||-1!==a.message.indexOf("Script error")?3:0));r=null;p&&q>=l&&(window.onerror=null)};})();</script></head><body bgcolor="#fff"><script nonce="64roBvn9KnMlhLbNBN3o5w">(function(){var src='/images/nav_logo229.png';var iesg=false;document.body.onload = function(){window.n && window.n();if (document.images){new Image().src=src;}
if (!iesg){document.f&&document.f.q.focus();document.gbqf&&document.gbqf.q.focus();}
}
})();</script><div id="mngb"><div id=gbar><nobr><b class=gb1>&#26908;&#32034;</b> <a class=gb1 href="https://www.google.co.jp/imghp?hl=ja&tab=wi">&#30011;&#20687;</a> <a class=gb1 href="https://maps.google.co.jp/maps?hl=ja&tab=wl">&#12510;&#12483;&#12503;</a> <a class=gb1 href="https://play.google.com/?hl=ja&tab=w8">Play</a> <a class=gb1 href="https://www.youtube.com/?tab=w1">YouTube</a> <a class=gb1 href="https://news.google.com/?tab=wn">&#12491;&#12517;&#12540;&#12473;</a> <a class=gb1 href="https://mail.google.com/mail/?tab=wm">Gmail</a> <a class=gb1 href="https://drive.google.com/?tab=wo">&#12489;&#12521;&#12452;&#12502;</a> <a class=gb1 style="text-decoration:none" href="https://www.google.co.jp/intl/ja/about/products?tab=wh"><u>&#12418;&#12387;&#12392;&#35211;&#12427;</u> &raquo;</a></nobr></div><div id=guser width=100%><nobr><span id=gbn class=gbi></span><span id=gbf class=gbf></span><span id=gbe></span><a href="http://www.google.co.jp/history/optout?hl=ja" class=gb4>&#12454;&#12455;&#12502;&#23653;&#27508;</a> | <a  href="/preferences?hl=ja" class=gb4>&#35373;&#23450;</a> | <a target=_top id=gb_70 href="https://accounts.google.com/ServiceLogin?hl=ja&passive=true&continue=https://www.google.com/&ec=GAZAAQ" class=gb4>&#12525;&#12464;&#12452;&#12531;</a></nobr></div><div class=gbh style=left:0></div><div class=gbh style=right:0></div></div><center><br clear="all" id="lgpd"><div id="lga"><img alt="Google" height="92" src="/images/branding/googlelogo/1x/googlelogo_white_background_color_272x92dp.png" style="padding:28px 0 14px" width="272" id="hplogo"><br><br></div><form action="/search" name="f"><table cellpadding="0" cellspacing="0"><tr valign="top"><td width="25%">&nbsp;</td><td align="center" nowrap=""><input name="ie" value="ISO-8859-1" type="hidden"><input value="ja" name="hl" type="hidden"><input name="source" type="hidden" value="hp"><input name="biw" type="hidden"><input name="bih" type="hidden"><div class="ds" style="height:32px;margin:4px 0"><input class="lst" style="margin:0;padding:5px 8px 0 6px;vertical-align:top;color:#000" autocomplete="off" value="" title="Google &#26908;&#32034;" maxlength="2048" name="q" size="57"></div><br style="line-height:0"><span class="ds"><span class="lsbb"><input class="lsb" value="Google &#26908;&#32034;" name="btnG" type="submit"></span></span><span class="ds"><span class="lsbb"><input class="lsb" id="tsuid_1" value="I'm Feeling Lucky" name="btnI" type="submit"><script nonce="64roBvn9KnMlhLbNBN3o5w">(function(){var id='tsuid_1';document.getElementById(id).onclick = function(){if (this.form.q.value){this.checked = 1;if (this.form.iflsig)this.form.iflsig.disabled = false;}
else top.location='/doodles/';};})();</script><input value="AJiK0e8AAAAAY4Ylnd1ISo50uTS5MFe5c76o_YcYavkQ" name="iflsig" type="hidden"></span></span></td><td class="fl sblc" align="left" nowrap="" width="25%"><a href="/advanced_search?hl=ja&amp;authuser=0">&#26908;&#32034;&#12458;&#12503;&#12471;&#12519;&#12531;</a></td></tr></table><input id="gbv" name="gbv" type="hidden" value="1"><script nonce="64roBvn9KnMlhLbNBN3o5w">(function(){var a,b="1";if(document&&document.getElementById)if("undefined"!=typeof XMLHttpRequest)b="2";else if("undefined"!=typeof ActiveXObject){var c,d,e=["MSXML2.XMLHTTP.6.0","MSXML2.XMLHTTP.3.0","MSXML2.XMLHTTP","Microsoft.XMLHTTP"];for(c=0;d=e[c++];)try{new ActiveXObject(d),b="2"}catch(h){}}a=b;if("2"==a&&-1==location.search.indexOf("&gbv=2")){var f=google.gbvu,g=document.getElementById("gbv");g&&(g.value=a);f&&window.setTimeout(function(){location.href=f},0)};}).call(this);</script></form><div id="gac_scont"></div><div style="font-size:83%;min-height:3.5em"><br></div><span id="footer"><div style="font-size:10pt"><div style="margin:19px auto;text-align:center" id="WqQANb"><a href="http://www.google.co.jp/intl/ja/services/">&#12499;&#12472;&#12493;&#12473; &#12477;&#12522;&#12517;&#12540;&#12471;&#12519;&#12531;</a><a href="/intl/ja/about.html">Google &#12395;&#12388;&#12356;&#12390;</a><a href="https://www.google.com/setprefdomain?prefdom=JP&amp;prev=https://www.google.co.jp/&amp;sig=K_pUPEFD3GRNU0RA835GHiv-cW2uo%3D">Google.co.jp</a></div></div><p style="font-size:8pt;color:#70757a">&copy; 2022 - <a href="/intl/ja/policies/privacy/">&#12503;&#12521;&#12452;&#12496;&#12471;&#12540;</a> - <a href="/intl/ja/policies/terms/">&#35215;&#32004;</a></p></span></center><script nonce="64roBvn9KnMlhLbNBN3o5w">(function(){window.google.cdo={height:757,width:1440};(function(){var a=window.innerWidth,b=window.innerHeight;if(!a||!b){var c=window.document,d="CSS1Compat"==c.compatMode?c.documentElement:c.body;a=d.clientWidth;b=d.clientHeight}a&&b&&(a!=google.cdo.width||b!=google.cdo.height)&&google.log("","","/client_204?&atyp=i&biw="+a+"&bih="+b+"&ei="+google.kEI);}).call(this);})();</script> <script nonce="64roBvn9KnMlhLbNBN3o5w">(function(){google.xjs={ck:'xjs.hp.o5AfvK7BgaM.L.X.O',cs:'ACT90oHYeVP2Dhl_7iuSPJ-kmBX9I1TdlA',excm:[]};})();</script>  <script nonce="64roBvn9KnMlhLbNBN3o5w">(function(){var u='/xjs/_/js/k\x3dxjs.hp.en.dE-FG74hDaY.O/am\x3dAADoBABQAGAB/d\x3d1/ed\x3d1/rs\x3dACT90oEgcGLBR3Xg2czKlKHLkgkwguUztg/m\x3dsb_he,d';var amd=0;
var d=this||self,e=function(a){return a};var g;var l=function(a,b){this.g=b===h?a:""};l.prototype.toString=function(){return this.g+""};var h={};
function m(){var a=u;google.lx=function(){p(a);google.lx=function(){}};google.bx||google.lx()}
function p(a){google.timers&&google.timers.load&&google.tick&&google.tick("load","xjsls");var b=document;var c="SCRIPT";"application/xhtml+xml"===b.contentType&&(c=c.toLowerCase());c=b.createElement(c);if(void 0===g){b=null;var k=d.trustedTypes;if(k&&k.createPolicy){try{b=k.createPolicy("goog#html",{createHTML:e,createScript:e,createScriptURL:e})}catch(q){d.console&&d.console.error(q.message)}g=b}else g=b}a=(b=g)?b.createScriptURL(a):a;a=new l(a,h);c.src=a instanceof l&&a.constructor===l?a.g:"type_error:TrustedResourceUrl";var f,n;(f=(a=null==(n=(f=(c.ownerDocument&&c.ownerDocument.defaultView||window).document).querySelector)?void 0:n.call(f,"script[nonce]"))?a.nonce||a.getAttribute("nonce")||"":"")&&c.setAttribute("nonce",f);document.body.appendChild(c);google.psa=!0};google.xjsu=u;setTimeout(function(){0<amd?google.caft(function(){return m()},amd):m()},0);})();function _DumpException(e){throw e;}
function _F_installCss(c){}
(function(){google.jl={blt:'none',chnk:0,dw:false,dwu:true,emtn:0,end:0,ico:false,ikb:0,ine:false,injs:'none',injt:0,injth:0,injv2:false,lls:'default',pdt:0,rep:0,snet:true,strt:0,ubm:false,uwp:true};})();(function(){var pmc='{\x22d\x22:{},\x22sb_he\x22:{\x22agen\x22:true,\x22cgen\x22:true,\x22client\x22:\x22heirloom-hp\x22,\x22dh\x22:true,\x22ds\x22:\x22\x22,\x22fl\x22:true,\x22host\x22:\x22google.com\x22,\x22jsonp\x22:true,\x22msgs\x22:{\x22cibl\x22:\x22&#26908;&#32034;&#12434;&#12463;&#12522;&#12450;\x22,\x22dym\x22:\x22&#12418;&#12375;&#12363;&#12375;&#12390;:\x22,\x22lcky\x22:\x22I\\u0026#39;m Feeling Lucky\x22,\x22lml\x22:\x22&#35443;&#32048;\x22,\x22psrc\x22:\x22&#12371;&#12398;&#26908;&#32034;&#12461;&#12540;&#12527;&#12540;&#12489;&#12399;\\u003Ca href\x3d\\\x22/history\\\x22\\u003E&#12454;&#12455;&#12502;&#23653;&#27508;\\u003C/a\\u003E&#12363;&#12425;&#21066;&#38500;&#12373;&#12428;&#12414;&#12375;&#12383;\x22,\x22psrl\x22:\x22&#21066;&#38500;\x22,\x22sbit\x22:\x22&#30011;&#20687;&#12391;&#26908;&#32034;\x22,\x22srch\x22:\x22Google &#26908;&#32034;\x22},\x22ovr\x22:{},\x22pq\x22:\x22\x22,\x22rfs\x22:[],\x22sbas\x22:\x220 3px 8px 0 rgba(0,0,0,0.2),0 0 0 1px rgba(0,0,0,0.08)\x22,\x22stok\x22:\x22S621HFZfDvqQ8myoTxkcoghBGgo\x22}}';google.pmc=JSON.parse(pmc);})();</script>        </body></html><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=Shift_JIS">
<meta name="GENERATOR" content="JustSystems Homepage Builder Version 20.0.6.0 for Windows">
<meta http-equiv="Content-Style-Type" content="text/css">
<title>阿部寛のホームページ</title>
</head>
<frameset cols=18,82>
  <frame src="menu.htm" marginheight="0" marginwidth="0" scrolling="auto" name="left">
  <frame src="top.htm" marginheight="0" marginwidth="0" scrolling="auto" name="right">
  <noframes>
  <body></body>
  </noframes>
</frameset>
</html>
```

</details>

## bffcalc

https://zenn.dev/oboenikui/articles/bd0cc264a68cf0#bffcalc


onerrorイベント
>onerrorイベント（エラーイベント）とは、ドキュメントや画像を読み込めず、エラーになった時のイベント。

```html
<!-- 画像を読み込めずエラーになった時点にイベントハンドラを登録する場合。 -->
<img onerror="イベントハンドラ">
```

onerrorイベントでjavascriptを実行できる

```html
<img src=a onerror="alert()"/>
```

BFFとは
>BFF とは、Backend For Frontendの略称で、「フロントエンドとバックエンドの中間に配置され双方の複雑な処理を緩和させる責務を持つアーキテクチャ設計パターン」のことです。これだけだと分かりづらいので簡単にまとめると、「バックエンドの API から取得したデータをフロントエンド向けに加工するフロントエンド専用のサーバー(API Gateway)」です。

>マイクロサービス化や Web アプリケーションと iOS アプリケーションなどを両立させる際、API サーバーへのリクエスト負荷やレスポンスのパターン増加による処理の複雑化などの課題が発生します。そこで中間に BFF レイヤーを配置することで、フロントエンドとバックエンドの連携における処理が分散され、アクセスフローがシンプルになります。
https://zenn.dev/offers/articles/20220418-what-is-bff-architecture

>BFFの存在により、下図のようにフロントエンドはBFFにのみリクエストを送る事になり、通信量の肥大化を防ぐ事ができます。クライアントの実装も接続先はBFFのみとなるのでシンプルにできます。また、バックエンドAPIに修正があった際もBFFにてその対応が吸収できるので、各クライアントでの対応は不要です
https://techblog.zozo.com/entry/zozo-aggregation-api-bff
