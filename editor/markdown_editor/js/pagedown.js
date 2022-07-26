var Markdown;
if (typeof exports === "object" && typeof require === "function") { Markdown = exports } else { Markdown = {} }(function() {
  function c(e) { return e }

  function d(e) { return false }

  function b() {} b.prototype = { chain: function(g, f) { var e = this[g]; if (!e) { throw new Error("unknown hook " + g) } if (e === c) { this[g] = f } else { this[g] = function(i) { var h = Array.prototype.slice.call(arguments, 0);
          h[0] = e.apply(null, h); return f.apply(null, h) } } }, set: function(f, e) { if (!this[f]) { throw new Error("unknown hook " + f) } this[f] = e }, addNoop: function(e) { this[e] = c }, addFalse: function(e) { this[e] = d } };
  Markdown.HookCollection = b;

  function a() {} a.prototype = { set: function(e, f) { this["s_" + e] = f }, get: function(e) { return this["s_" + e] } };
  Markdown.Converter = function() { var l = this.hooks = new b();
    l.addNoop("plainLinkText");
    l.addNoop("preConversion");
    l.addNoop("postNormalization");
    l.addNoop("preBlockGamut");
    l.addNoop("postBlockGamut");
    l.addNoop("preSpanGamut");
    l.addNoop("postSpanGamut");
    l.addNoop("postConversion"); var y; var p; var e; var C;
    this.makeHtml = function(V) { if (y) { throw new Error("Recursive call to converter.makeHtml") } y = new a();
      p = new a();
      e = [];
      C = 0;
      V = l.preConversion(V);
      V = V.replace(/~/g, "~T");
      V = V.replace(/\$/g, "~D");
      V = V.replace(/\r\n/g, "\n");
      V = V.replace(/\r/g, "\n");
      V = "\n\n" + V + "\n\n";
      V = N(V);
      V = V.replace(/^[ \t]+$/mg, "");
      V = l.postNormalization(V);
      V = q(V);
      V = o(V);
      V = h(V);
      V = Q(V);
      V = V.replace(/~D/g, "$$");
      V = V.replace(/~T/g, "~");
      V = l.postConversion(V);
      e = p = y = null; return V };

    function o(V) { V = V.replace(/^[ ]{0,3}\[(.+)\]:[ \t]*\n?[ \t]*<?(\S+?)>?(?=\s|$)[ \t]*\n?[ \t]*((\n*)["(](.+?)[")][ \t]*)?(?:\n+)/gm, function(Y, aa, Z, X, W, ab) { aa = aa.toLowerCase();
        y.set(aa, F(Z)); if (W) { return X } else { if (ab) { p.set(aa, ab.replace(/"/g, "&quot;")) } } return "" }); return V }

    function q(X) { var W = "p|div|h[1-6]|blockquote|pre|table|dl|ol|ul|script|noscript|form|fieldset|iframe|math|ins|del"; var V = "p|div|h[1-6]|blockquote|pre|table|dl|ol|ul|script|noscript|form|fieldset|iframe|math";
      X = X.replace(/^(<(p|div|h[1-6]|blockquote|pre|table|dl|ol|ul|script|noscript|form|fieldset|iframe|math|ins|del)\b[^\r]*?\n<\/\2>[ \t]*(?=\n+))/gm, T);
      X = X.replace(/^(<(p|div|h[1-6]|blockquote|pre|table|dl|ol|ul|script|noscript|form|fieldset|iframe|math)\b[^\r]*?.*<\/\2>[ \t]*(?=\n+)\n)/gm, T);
      X = X.replace(/\n[ ]{0,3}((<(hr)\b([^<>])*?\/?>)[ \t]*(?=\n{2,}))/g, T);
      X = X.replace(/\n\n[ ]{0,3}(<!(--(?:|(?:[^>-]|-[^>])(?:[^-]|-[^-])*)--)>[ \t]*(?=\n{2,}))/g, T);
      X = X.replace(/(?:\n\n)([ ]{0,3}(?:<([?%])[^\r]*?\2>)[ \t]*(?=\n{2,}))/g, T); return X }

    function T(V, W) { var X = W;
      X = X.replace(/^\n+/, "");
      X = X.replace(/\n+$/g, "");
      X = "\n\n~K" + (e.push(X) - 1) + "K\n\n"; return X } var g = function(V) { return h(V) };

    function h(X, W) { X = l.preBlockGamut(X, g);
      X = k(X); var V = "<hr />\n";
      X = X.replace(/^[ ]{0,2}([ ]?\*[ ]?){3,}[ \t]*$/gm, V);
      X = X.replace(/^[ ]{0,2}([ ]?-[ ]?){3,}[ \t]*$/gm, V);
      X = X.replace(/^[ ]{0,2}([ ]?_[ ]?){3,}[ \t]*$/gm, V);
      X = P(X);
      X = s(X);
      X = i(X);
      X = l.postBlockGamut(X, g);
      X = q(X);
      X = M(X, W); return X }

    function m(V) { V = l.preSpanGamut(V);
      V = t(V);
      V = x(V);
      V = K(V);
      V = G(V);
      V = H(V);
      V = O(V);
      V = V.replace(/~P/g, "://");
      V = F(V);
      V = A(V);
      V = V.replace(/ *\n/g, " <br>\n");
      V = l.postSpanGamut(V); return V }

    function x(W) { var V = /(<[a-z\/!$]("[^"]*"|'[^']*'|[^'">])*>|<!(--(?:|(?:[^>-]|-[^>])(?:[^-]|-[^-])*)--)>)/gi;
      W = W.replace(V, function(Y) { var X = Y.replace(/(.)<\/?code>(?=.)/g, "$1`");
        X = B(X, Y.charAt(1) == "!" ? "\\`*_/" : "\\`*_"); return X }); return W }

    function H(V) { V = V.replace(/(\[((?:\[[^\]]*\]|[^\[\]])*)\][ ]?(?:\n[ ]*)?\[(.*?)\])()()()()/g, j);
      V = V.replace(/(\[((?:\[[^\]]*\]|[^\[\]])*)\]\([ \t]*()<?((?:\([^)]*\)|[^()\s])*?)>?[ \t]*((['"])(.*?)\6[ \t]*)?\))/g, j);
      V = V.replace(/(\[([^\[\]]+)\])()()()()()/g, j); return V }

    function j(ab, ah, ag, af, ae, ad, aa, Z) { if (Z == undefined) { Z = "" } var Y = ah; var W = ag.replace(/:\/\//g, "~P"); var X = af.toLowerCase(); var V = ae; var ac = Z; if (V == "") { if (X == "") { X = W.toLowerCase().replace(/ ?\n/g, " ") } V = "#" + X; if (y.get(X) != undefined) { V = y.get(X); if (p.get(X) != undefined) { ac = p.get(X) } } else { if (Y.search(/\(\s*\)$/m) > -1) { V = "" } else { return Y } } } V = D(V);
      V = B(V, "*_"); var ai = '<a href="' + V + '"'; if (ac != "") { ac = J(ac);
        ac = B(ac, "*_");
        ai += ' title="' + ac + '"' } ai += ">" + W + "</a>"; return ai }

    function G(V) { V = V.replace(/(!\[(.*?)\][ ]?(?:\n[ ]*)?\[(.*?)\])()()()()/g, I);
      V = V.replace(/(!\[(.*?)\]\s?\([ \t]*()<?(\S+?)>?[ \t]*((['"])(.*?)\6[ \t]*)?\))/g, I); return V }

    function J(V) { return V.replace(/>/g, "&gt;").replace(/</g, "&lt;").replace(/"/g, "&quot;") }

    function I(ab, ah, ag, af, ae, ad, aa, Z) { var Y = ah; var X = ag; var W = af.toLowerCase(); var V = ae; var ac = Z; if (!ac) { ac = "" } if (V == "") { if (W == "") { W = X.toLowerCase().replace(/ ?\n/g, " ") } V = "#" + W; if (y.get(W) != undefined) { V = y.get(W); if (p.get(W) != undefined) { ac = p.get(W) } } else { return Y } } X = B(J(X), "*_[]()");
      V = B(V, "*_"); var ai = '<img src="' + V + '" alt="' + X + '"';
      ac = J(ac);
      ac = B(ac, "*_");
      ai += ' title="' + ac + '"';
      ai += " />"; return ai }

    function k(V) { V = V.replace(/^(.+)[ \t]*\n=+[ \t]*\n+/gm, function(W, X) { return "<h1>" + m(X) + "</h1>\n\n" });
      V = V.replace(/^(.+)[ \t]*\n-+[ \t]*\n+/gm, function(X, W) { return "<h2>" + m(W) + "</h2>\n\n" });
      V = V.replace(/^(\#{1,6})[ \t]*(.+?)[ \t]*\#*\n+/gm, function(W, Z, Y) { var X = Z.length; return "<h" + X + ">" + m(Y) + "</h" + X + ">\n\n" }); return V }

    function P(X, V) { X += "~0"; var W = /^(([ ]{0,3}([*+-]|\d+[.])[ \t]+)[^\r]+?(~0|\n{2,}(?=\S)(?![ \t]*(?:[*+-]|\d+[.])[ \t]+)))/gm; if (C) { X = X.replace(W, function(Z, ac, ab) { var ad = ac; var aa = (ab.search(/[*+-]/g) > -1) ? "ul" : "ol"; var Y = n(ad, aa, V);
          Y = Y.replace(/\s+$/, "");
          Y = "<" + aa + ">" + Y + "</" + aa + ">\n"; return Y }) } else { W = /(\n\n|^\n?)(([ ]{0,3}([*+-]|\d+[.])[ \t]+)[^\r]+?(~0|\n{2,}(?=\S)(?![ \t]*(?:[*+-]|\d+[.])[ \t]+)))/g;
        X = X.replace(W, function(aa, ae, ac, Z) { var ad = ae; var af = ac; var ab = (Z.search(/[*+-]/g) > -1) ? "ul" : "ol"; var Y = n(af, ab);
          Y = ad + "<" + ab + ">\n" + Y + "</" + ab + ">\n"; return Y }) } X = X.replace(/~0/, ""); return X } var r = { ol: "\\d+[.]", ul: "[*+-]" };

    function n(X, W, aa) { C++;
      X = X.replace(/\n{2,}$/, "\n");
      X += "~0"; var V = r[W]; var Y = new RegExp("(^[ \\t]*)(" + V + ")[ \\t]+([^\\r]+?(\\n+))(?=(~0|\\1(" + V + ")[ \\t]+))", "gm"); var Z = false;
      X = X.replace(Y, function(ac, ae, ad, ab) { var ah = ab; var ai = ae; var ag = /\n\n$/.test(ah); var af = ag || ah.search(/\n{2,}/) > -1; if (af || Z) { ah = h(v(ah), true) } else { ah = P(v(ah), true);
          ah = ah.replace(/\n$/, ""); if (!aa) { ah = m(ah) } } Z = ag; return "<li>" + ah + "</li>\n" });
      X = X.replace(/~0/g, "");
      C--; return X }

    function s(V) { V += "~0";
      V = V.replace(/(?:\n\n|^\n?)((?:(?:[ ]{4}|\t).*\n+)+)(\n*[ ]{0,3}[^ \t\n]|(?=~0))/g, function(W, Y, X) { var Z = Y; var aa = X;
        Z = E(v(Z));
        Z = N(Z);
        Z = Z.replace(/^\n+/g, "");
        Z = Z.replace(/\n+$/g, "");
        Z = "<pre><code>" + Z + "\n</code></pre>"; return "\n\n" + Z + "\n\n" + aa });
      V = V.replace(/~0/, ""); return V }

    function S(V) { V = V.replace(/(^\n+|\n+$)/g, ""); return "\n\n~K" + (e.push(V) - 1) + "K\n\n" }

    function t(V) { V = V.replace(/(^|[^\\])(`+)([^\r]*?[^`])\2(?!`)/gm, function(Y, aa, Z, X, W) { var ab = X;
        ab = ab.replace(/^([ \t]*)/g, "");
        ab = ab.replace(/[ \t]*$/g, "");
        ab = E(ab);
        ab = ab.replace(/:\/\//g, "~P"); return aa + "<code>" + ab + "</code>" }); return V }

    function E(V) { V = V.replace(/&/g, "&amp;");
      V = V.replace(/</g, "&lt;");
      V = V.replace(/>/g, "&gt;");
      V = B(V, "*_{}[]\\", false); return V }

    function A(V) { V = V.replace(/(\*\*|__)(?=\S)([^\r]*?\S[*_]*)\1/g, "<strong>$2</strong>");
      V = V.replace(/(\*|_)(?=\S)([^\r]*?\S)\1/g, "<em>$2</em>"); return V }

    function i(V) { V = V.replace(/((^[ \t]*>[ \t]?.+\n(.+\n)*\n*)+)/gm, function(W, X) { var Y = X;
        Y = Y.replace(/^[ \t]*>[ \t]?/gm, "~0");
        Y = Y.replace(/~0/g, "");
        Y = Y.replace(/^[ \t]+$/gm, "");
        Y = h(Y);
        Y = Y.replace(/(^|\n)/g, "$1  ");
        Y = Y.replace(/(\s*<pre>[^\r]+?<\/pre>)/gm, function(Z, aa) { var ab = aa;
          ab = ab.replace(/^  /mg, "~0");
          ab = ab.replace(/~0/g, ""); return ab }); return S("<blockquote>\n" + Y + "\n</blockquote>") }); return V }

    function M(ac, V) { ac = ac.replace(/^\n+/g, "");
      ac = ac.replace(/\n+$/g, ""); var ad = ac.split(/\n{2,}/g); var aa = []; var W = /~K(\d+)K/; var X = ad.length; for (var Y = 0; Y < X; Y++) { var Z = ad[Y]; if (W.test(Z)) { aa.push(Z) } else { if (/\S/.test(Z)) { Z = m(Z);
            Z = Z.replace(/^([ \t]*)/g, "<p>");
            Z += "</p>";
            aa.push(Z) } } } if (!V) { X = aa.length; for (var Y = 0; Y < X; Y++) { var ab = true; while (ab) { ab = false;
            aa[Y] = aa[Y].replace(/~K(\d+)K/g, function(ae, af) { ab = true; return e[af] }) } } } return aa.join("\n\n") }

    function F(V) { V = V.replace(/&(?!#?[xX]?(?:[0-9a-fA-F]+|\w+);)/g, "&amp;");
      V = V.replace(/<(?![a-z\/?!]|~D)/gi, "&lt;"); return V }

    function K(V) { V = V.replace(/\\(\\)/g, u);
      V = V.replace(/\\([`*_{}\[\]()>#+-.!])/g, u); return V } var z = "[-A-Z0-9+&@#/%?=~_|[\\]()!:,.;]",
      U = "[-A-Z0-9+&@#/%=~_|[\\])]",
      L = new RegExp('(="|<)?\\b(https?|ftp)(://' + z + "*" + U + ")(?=$|\\W)", "gi"),
      R = new RegExp(U, "i");

    function f(Z, ac, ae, Y) { if (ac) { return Z } if (Y.charAt(Y.length - 1) !== ")") { return "<" + ae + Y + ">" } var aa = Y.match(/[()]/g); var V = 0; for (var W = 0; W < aa.length; W++) { if (aa[W] === "(") { if (V <= 0) { V = 1 } else { V++ } } else { V-- } } var X = ""; if (V < 0) { var ad = new RegExp("\\){1," + (-V) + "}$");
        Y = Y.replace(ad, function(af) { X = af; return "" }) } if (X) { var ab = Y.charAt(Y.length - 1); if (!R.test(ab)) { X = ab + X;
          Y = Y.substr(0, Y.length - 1) } } return "<" + ae + Y + ">" + X }

    function O(W) { W = W.replace(L, f); var V = function(Y, X) { return '<a href="' + X + '">' + l.plainLinkText(X) + "</a>" };
      W = W.replace(/<((https?|ftp):[^'">\s]+)>/gi, V); return W }

    function Q(V) { V = V.replace(/~E(\d+)E/g, function(W, Y) { var X = parseInt(Y); return String.fromCharCode(X) }); return V }

    function v(V) { V = V.replace(/^(\t|[ ]{1,4})/gm, "~0");
      V = V.replace(/~0/g, ""); return V }

    function N(Y) { if (!/\t/.test(Y)) { return Y } var X = ["    ", "   ", "  ", " "],
        W = 0,
        V; return Y.replace(/[\n\t]/g, function(Z, aa) { if (Z === "\n") { W = aa + 1; return Z } V = (aa - W) % 4;
        W = aa + 1; return X[V] }) } var w = /(?:["'*()[\]:]|~D)/g;

    function D(W) { if (!W) { return "" } var V = W.length; return W.replace(w, function(X, Y) { if (X == "~D") { return "%24" } if (X == ":") { if (Y == V - 1 || /[0-9\/]/.test(W.charAt(Y + 1))) { return ":" } } return "%" + X.charCodeAt(0).toString(16) }) }

    function B(Z, W, X) { var V = "([" + W.replace(/([\[\]\\])/g, "\\$1") + "])"; if (X) { V = "\\\\" + V } var Y = new RegExp(V, "g");
      Z = Z.replace(Y, u); return Z }

    function u(V, X) { var W = X.charCodeAt(0); return "~E" + W + "E" } } })();
(function() { var a, d; if (typeof exports === "object" && typeof require === "function") { a = exports;
    d = require("./Markdown.Converter").Converter } else { a = window.Markdown;
    d = a.Converter } a.getSanitizingConverter = function() { var i = new d();
    i.hooks.chain("postConversion", c);
    i.hooks.chain("postConversion", b); return i };

  function c(i) { return i.replace(/<[^>]*>?/gi, e) } var f = /^(<\/?(b|blockquote|code|del|dd|dl|dt|em|h1|h2|h3|i|kbd|li|ol|p|pre|s|sup|sub|strong|strike|ul)>|<(br|hr)\s?\/?>)$/i; var g = /^(<a\shref="((https?|ftp):\/\/|\/)[-A-Za-z0-9+&@#\/%?=~_|!:,.;\(\)]+"(\stitle="[^"<>]+")?\s?>|<\/a>)$/i; var h = /^(<img\ssrc="(https?:\/\/|\/)[-A-Za-z0-9+&@#\/%?=~_|!:,.;\(\)]+"(\swidth="\d{1,3}")?(\sheight="\d{1,3}")?(\salt="[^"<>]*")?(\stitle="[^"<>]*")?\s?\/?>)$/i;

  function e(i) { if (i.match(f) || i.match(g) || i.match(h)) { return i } else { return "" } }

  function b(m) { if (m == "") { return "" } var s = /<\/?\w+[^>]*(\s|$|>)/g; var t = m.toLowerCase().match(s); var r = (t || []).length; if (r == 0) { return m } var q, u; var p = "<p><img><br><li><hr>"; var n; var o = []; var j = []; var l = false; for (var i = 0; i < r; i++) { q = t[i].replace(/<\/?(\w+).*/, "$1"); if (o[i] || p.search("<" + q + ">") > -1) { continue } u = t[i];
      n = -1; if (!/^<\//.test(u)) { for (var k = i + 1; k < r; k++) { if (!o[k] && t[k] == "</" + q + ">") { n = k; break } } } if (n == -1) { l = j[i] = true } else { o[n] = true } } if (!l) { return m } var i = 0;
    m = m.replace(s, function(v) { var w = j[i] ? "" : v;
      i++; return w }); return m } })();
(function() { var a = {},
    u = {},
    m = {},
    w = window.document,
    n = window.RegExp,
    g = window.navigator,
    q = { lineLength: 72 },
    v = { isIE: /msie/.test(g.userAgent.toLowerCase()), isIE_5or6: /msie 6/.test(g.userAgent.toLowerCase()) || /msie 5/.test(g.userAgent.toLowerCase()), isOpera: /opera/.test(g.userAgent.toLowerCase()) }; var i = { bold: "Strong <strong> Ctrl+B", boldexample: "strong text", italic: "Emphasis <em> Ctrl+I", italicexample: "emphasized text", link: "Hyperlink <a> Ctrl+L", linkdescription: "enter link description here", linkdialog: '<p><b>Insert Hyperlink</b></p><p>http://example.com/ "optional title"</p>', linkname: null, quote: "Blockquote <blockquote> Ctrl+Q", quoteexample: "Blockquote", code: "Code Sample <pre><code> Ctrl+K", codeexample: "enter code here", image: "Image <img> Ctrl+G", imagedescription: "enter image description here", imagedialog: "<p><b>Insert Image</b></p><p>http://example.com/images/diagram.jpg \"optional title\"<br>Need <a href='http://www.google.com/search?q=free+image+hosting' target='_blank'>free image hosting?</a></p>", imagename: null, olist: "Numbered List <ol> Ctrl+O", ulist: "Bulleted List <ul> Ctrl+U", litem: "List item", heading: "Heading <h1>/<h2> Ctrl+H", headingexample: "Heading", more: "More contents <!--more--> Ctrl+M", fullscreen: "FullScreen Ctrl+J", exitFullscreen: "Exit FullScreen Ctrl+E", fullscreenUnsupport: "Sorry, the browser dont support fullscreen api", hr: "Horizontal Rule <hr> Ctrl+R", undo: "Undo - Ctrl+Z", redo: "Redo - Ctrl+Y", redomac: "Redo - Ctrl+Shift+Z", ok: "OK", cancel: "Cancel", help: "Markdown Editing Help" }; var c = "http://"; var d = "http://";
  Markdown.Editor = function(B, D, A) { A = A || {}; if (typeof A.handler === "function") { A = { helpButton: A } } A.strings = A.strings || {}; if (A.helpButton) { A.strings.help = A.strings.help || A.helpButton.title } var y = function(F) { var E = A.strings[F] || i[F]; if ("imagename" == F || "linkname" == F) { A.strings[F] = null } return E };
    D = D || ""; var x = this.hooks = new Markdown.HookCollection();
    x.addNoop("onPreviewRefresh");
    x.addNoop("postBlockquoteCreation");
    x.addFalse("insertImageDialog");
    x.addFalse("insertLinkDialog");
    x.addNoop("enterFullScreen");
    x.addNoop("enterFakeFullScreen");
    x.addNoop("exitFullScreen");
    this.getConverter = function() { return B }; var C = this,
      z;
    this.run = function() { if (z) { return } z = new k(D); var G = new l(x, y); var E = new h(B, z, function() { x.onPreviewRefresh() }); var H, F; if (!/\?noundo/.test(w.location.href)) { H = new e(function() { E.refresh(); if (F) { F.setUndoRedoButtonStates() } }, z);
        this.textOperation = function(J) { H.setCommandMode();
          J();
          C.refreshPreview() } } fullScreenManager = new o(x, y);
      F = new t(D, z, H, E, G, fullScreenManager, A.helpButton, y);
      F.setUndoRedoButtonStates(); var I = C.refreshPreview = function() { E.refresh(true) };
      I() } };

  function s() {} s.prototype.findTags = function(y, A) { var x = this; var z; if (y) { z = a.extendRegExp(y, "", "$");
      this.before = this.before.replace(z, function(B) { x.startTag = x.startTag + B; return "" });
      z = a.extendRegExp(y, "^", "");
      this.selection = this.selection.replace(z, function(B) { x.startTag = x.startTag + B; return "" }) } if (A) { z = a.extendRegExp(A, "", "$");
      this.selection = this.selection.replace(z, function(B) { x.endTag = B + x.endTag; return "" });
      z = a.extendRegExp(A, "^", "");
      this.after = this.after.replace(z, function(B) { x.endTag = B + x.endTag; return "" }) } };
  s.prototype.trimWhitespace = function(y) { var x, A, z = this; if (y) { x = A = "" } else { x = function(B) { z.before += B; return "" };
      A = function(B) { z.after = B + z.after; return "" } } this.selection = this.selection.replace(/^(\s*)/, x).replace(/(\s*)$/, A) };
  s.prototype.skipLines = function(z, y, x) { if (z === undefined) { z = 1 } if (y === undefined) { y = 1 } z++;
    y++; var A; var B; if (navigator.userAgent.match(/Chrome/)) { "X".match(/()./) } this.selection = this.selection.replace(/(^\n*)/, "");
    this.startTag = this.startTag + n.$1;
    this.selection = this.selection.replace(/(\n*$)/, "");
    this.endTag = this.endTag + n.$1;
    this.startTag = this.startTag.replace(/(^\n*)/, "");
    this.before = this.before + n.$1;
    this.endTag = this.endTag.replace(/(\n*$)/, "");
    this.after = this.after + n.$1; if (this.before) { A = B = ""; while (z--) { A += "\\n?";
        B += "\n" } if (x) { A = "\\n*" } this.before = this.before.replace(new n(A + "$", ""), B) } if (this.after) { A = B = ""; while (y--) { A += "\\n?";
        B += "\n" } if (x) { A = "\\n*" } this.after = this.after.replace(new n(A, ""), B) } };

  function k(x) { this.buttonBar = w.getElementById("md-button-bar" + x);
    this.preview = w.getElementById("md-preview" + x);
    this.input = w.getElementById("text") } a.isVisible = function(x) { if (window.getComputedStyle) { return window.getComputedStyle(x, null).getPropertyValue("display") !== "none" } else { if (x.currentStyle) { return x.currentStyle.display !== "none" } } };
  a.addEvent = function(y, x, z) { if (y.attachEvent) { y.attachEvent("on" + x, z) } else { y.addEventListener(x, z, false) } };
  a.removeEvent = function(y, x, z) { if (y.detachEvent) { y.detachEvent("on" + x, z) } else { y.removeEventListener(x, z, false) } };
  a.fixEolChars = function(x) { x = x.replace(/\r\n/g, "\n");
    x = x.replace(/\r/g, "\n"); return x };
  a.extendRegExp = function(z, B, y) { if (B === null || B === undefined) { B = "" } if (y === null || y === undefined) { y = "" } var A = z.toString(); var x;
    A = A.replace(/\/([gim]*)$/, function(C, D) { x = D; return "" });
    A = A.replace(/(^\/|\/$)/g, "");
    A = B + A + y; return new n(A, x) };
  u.getTop = function(z, y) { var x = z.offsetTop; if (!y) { while (z = z.offsetParent) { x += z.offsetTop } } return x };
  u.getHeight = function(x) { return x.offsetHeight || x.scrollHeight };
  u.getWidth = function(x) { return x.offsetWidth || x.scrollWidth };
  u.getPageSize = function() { var y, z; var x, C; if (self.innerHeight && self.scrollMaxY) { y = w.body.scrollWidth;
      z = self.innerHeight + self.scrollMaxY } else { if (w.body.scrollHeight > w.body.offsetHeight) { y = w.body.scrollWidth;
        z = w.body.scrollHeight } else { y = w.body.offsetWidth;
        z = w.body.offsetHeight } } if (self.innerHeight) { x = self.innerWidth;
      C = self.innerHeight } else { if (w.documentElement && w.documentElement.clientHeight) { x = w.documentElement.clientWidth;
        C = w.documentElement.clientHeight } else { if (w.body) { x = w.body.clientWidth;
          C = w.body.clientHeight } } } var B = Math.max(y, x); var A = Math.max(z, C); return [B, A, x, C] };

  function e(J, G) { var M = this; var H = []; var E = 0; var D = "none"; var y; var z; var C; var x = function(O, N) { if (D != O) { D = O; if (!N) { A() } } if (!v.isIE || D != "moving") { z = setTimeout(F, 1) } else { C = null } }; var F = function(N) { C = new b(G, N);
      z = undefined };
    this.setCommandMode = function() { D = "command";
      A();
      z = setTimeout(F, 0) };
    this.canUndo = function() { return E > 1 };
    this.canRedo = function() { if (H[E + 1]) { return true } return false };
    this.undo = function() { if (M.canUndo()) { if (y) { y.restore();
          y = null } else { H[E] = new b(G);
          H[--E].restore(); if (J) { J() } } } D = "none";
      G.input.focus();
      F() };
    this.redo = function() { if (M.canRedo()) { H[++E].restore(); if (J) { J() } } D = "none";
      G.input.focus();
      F() }; var A = function() { var N = C || new b(G); if (!N) { return false } if (D == "moving") { if (!y) { y = N } return } if (y) { if (H[E - 1].text != y.text) { H[E++] = y } y = null } H[E++] = N;
      H[E + 1] = null; if (J) { J() } }; var I = function(N) { var P = false; if ((N.ctrlKey || N.metaKey) && !N.altKey) { var O = N.charCode || N.keyCode; var Q = String.fromCharCode(O); switch (Q.toLowerCase()) {
          case "y":
            M.redo();
            P = true; break;
          case "z":
            if (!N.shiftKey) { M.undo() } else { M.redo() } P = true; break } } if (P) { if (N.preventDefault) { N.preventDefault() } if (window.event) { window.event.returnValue = false } return } }; var L = function(N) { if (!N.ctrlKey && !N.metaKey) { var O = N.keyCode; if ((O >= 33 && O <= 40) || (O >= 63232 && O <= 63235)) { x("moving") } else { if (O == 8 || O == 46 || O == 127) { x("deleting") } else { if (O == 13) { x("newlines") } else { if (O == 27) { x("escape") } else { if ((O < 16 || O > 20) && O != 91) { x("typing") } } } } } } }; var B = function() { a.addEvent(G.input, "keypress", function(O) { if ((O.ctrlKey || O.metaKey) && !O.altKey && (O.keyCode == 89 || O.keyCode == 90)) { O.preventDefault() } }); var N = function() { if (v.isIE || (C && C.text != G.input.value)) { if (z == undefined) { D = "paste";
            A();
            F() } } };
      a.addEvent(G.input, "keydown", I);
      a.addEvent(G.input, "keydown", L);
      a.addEvent(G.input, "mousedown", function() { x("moving") });
      G.input.onpaste = N;
      G.input.ondrop = N }; var K = function() { B();
      F(true);
      A() };
    K() }

  function b(y, A) { var x = this; var z = y.input;
    this.init = function() { if (!a.isVisible(z)) { return } if (!A && w.activeElement && w.activeElement !== z) { return } this.setInputAreaSelectionStartEnd();
      this.scrollTop = z.scrollTop; if (!this.text && z.selectionStart || z.selectionStart === 0) { this.text = z.value } };
    this.setInputAreaSelection = function() { if (!a.isVisible(z)) { return } if (z.selectionStart !== undefined && !v.isOpera) { z.focus();
        z.selectionStart = x.start;
        z.selectionEnd = x.end;
        z.scrollTop = x.scrollTop } else { if (w.selection) { if (w.activeElement && w.activeElement !== z) { return } z.focus(); var B = z.createTextRange();
          B.moveStart("character", -z.value.length);
          B.moveEnd("character", -z.value.length);
          B.moveEnd("character", x.end);
          B.moveStart("character", x.start);
          B.select() } } };
    this.setInputAreaSelectionStartEnd = function() { if (!y.ieCachedRange && (z.selectionStart || z.selectionStart === 0)) { x.start = z.selectionStart;
        x.end = z.selectionEnd } else { if (w.selection) { x.text = a.fixEolChars(z.value); var E = y.ieCachedRange || w.selection.createRange(); var F = a.fixEolChars(E.text); var D = "\x07"; var C = D + F + D;
          E.text = C; var G = a.fixEolChars(z.value);
          E.moveStart("character", -C.length);
          E.text = F;
          x.start = G.indexOf(D);
          x.end = G.lastIndexOf(D) - D.length; var B = x.text.length - a.fixEolChars(z.value).length; if (B) { E.moveStart("character", -F.length); while (B--) { F += "\n";
              x.end += 1 } E.text = F } if (y.ieCachedRange) { x.scrollTop = y.ieCachedScrollTop } y.ieCachedRange = null;
          this.setInputAreaSelection() } } };
    this.restore = function() { if (x.text != undefined && x.text != z.value) { z.value = x.text } this.setInputAreaSelection();
      z.scrollTop = x.scrollTop };
    this.getChunks = function() { var B = new s();
      B.before = a.fixEolChars(x.text.substring(0, x.start));
      B.startTag = "";
      B.selection = a.fixEolChars(x.text.substring(x.start, x.end));
      B.endTag = "";
      B.after = a.fixEolChars(x.text.substring(x.end));
      B.scrollTop = x.scrollTop; return B };
    this.setChunks = function(B) { B.before = B.before + B.startTag;
      B.after = B.endTag + B.after;
      this.start = B.before.length;
      this.end = B.before.length + B.selection.length;
      this.text = B.before + B.selection + B.after;
      this.scrollTop = B.scrollTop };
    this.init() }

  function h(R, A, L) { var y = this; var F; var E; var O; var z = 3000; var G = "delayed"; var C = function(T, U) { a.addEvent(T, "input", U);
      T.onpaste = U;
      T.ondrop = U;
      a.addEvent(T, "keypress", U);
      a.addEvent(T, "keydown", U) }; var K = function() { var T = 0; if (window.innerHeight) { T = window.pageYOffset } else { if (w.documentElement && w.documentElement.scrollTop) { T = w.documentElement.scrollTop } else { if (w.body) { T = w.body.scrollTop } } } return T }; var D = function() { if (!A.preview) { return } var V = A.input.value; if (V && V == O) { return } else { O = V } var U = new Date().getTime();
      V = R.makeHtml(V); var T = new Date().getTime();
      E = T - U;
      x(V) }; var Q = function() { if (F) { clearTimeout(F);
        F = undefined } if (G !== "manual") { var T = 0; if (G === "delayed") { T = E } if (T > z) { T = z } F = setTimeout(D, T) } }; var B = function(T) { if (T.scrollHeight <= T.clientHeight) { return 1 } return T.scrollTop / (T.scrollHeight - T.clientHeight) }; var S = function() { if (A.preview) { A.preview.scrollTop = (A.preview.scrollHeight - A.preview.clientHeight) * B(A.preview) } };
    this.refresh = function(T) { if (T) { O = "";
        D() } else { Q() } };
    this.processingTime = function() { return E }; var H = true; var I = function(W) { var V = A.preview; var U = V.parentNode; var T = V.nextSibling;
      U.removeChild(V);
      V.innerHTML = W; if (!T) { U.appendChild(V) } else { U.insertBefore(V, T) } }; var N = function(T) { A.preview.innerHTML = T }; var J; var M = function(U) { if (J) { return J(U) } try { N(U);
        J = N } catch (T) { J = I;
        J(U) } }; var x = function(V) { var T = u.getTop(A.input) - K(); if (A.preview) { M(V);
        L() } S(); if (H) { H = false; return } var U = u.getTop(A.input) - K(); if (v.isIE) { setTimeout(function() { window.scrollBy(0, U - T) }, 0) } else { window.scrollBy(0, U - T) } }; var P = function() { C(A.input, Q);
      D(); if (A.preview) { A.preview.scrollTop = 0 } };
    P() } m.createBackground = function() { var y = w.createElement("div"),
      z = y.style;
    y.className = "md-prompt-background";
    z.position = "absolute";
    z.top = "0";
    z.zIndex = "1000"; if (v.isIE) { z.filter = "alpha(opacity=50)" } else { z.opacity = "0.5" } var x = u.getPageSize();
    z.height = x[1] + "px"; if (v.isIE) { z.left = w.documentElement.scrollLeft;
      z.width = w.documentElement.clientWidth } else { z.left = "0";
      z.width = "100%" } w.body.appendChild(y); return y };
  m.prompt = function(C, G, A, y, E) { var x; var z; if (G === undefined) { G = "" } var B = function(H) { var I = (H.charCode || H.keyCode); if (I === 27) { D(true) } }; var D = function(H) { a.removeEvent(w.body, "keydown", B); var I = z.value; if (H) { I = null } else { I = I.replace(/^http:\/\/(https?|ftp):\/\//, "$1://"); if (!/^(?:https?|ftp):\/\//.test(I)) { I = "http://" + I } } x.parentNode.removeChild(x);
      A(I); return false }; var F = function() { x = w.createElement("div");
      x.className = "md-prompt-dialog"; var H = w.createElement("div");
      H.innerHTML = C;
      x.appendChild(H); var J = w.createElement("form"),
        I = J.style;
      J.onsubmit = function() { return D(false) };
      x.appendChild(J);
      z = w.createElement("input");
      z.type = "text";
      z.value = G;
      J.appendChild(z); var L = w.createElement("button");
      L.type = "button";
      L.className = "btn-s primary";
      L.onclick = function() { return D(false) };
      L.innerHTML = y; var K = w.createElement("button");
      K.type = "button";
      K.className = "btn-s";
      K.onclick = function() { return D(true) };
      K.innerHTML = E;
      J.appendChild(L);
      J.appendChild(K);
      a.addEvent(w.body, "keydown", B);
      w.body.appendChild(x) };
    setTimeout(function() { F(); var I = G.length; if (z.selectionStart !== undefined) { z.selectionStart = 0;
        z.selectionEnd = I } else { if (z.createTextRange) { var H = z.createTextRange();
          H.collapse(false);
          H.moveStart("character", -I);
          H.moveEnd("character", I);
          H.select() } } z.focus() }, 0) };

  function t(K, E, M, A, J, I, D, y) { var C = E.input,
      G = {};
    B(); var F = "keydown"; if (v.isOpera) { F = "keypress" } a.addEvent(C, F, function(O) { if ((O.ctrlKey || O.metaKey) && !O.altKey && !O.shiftKey) { var Q = O.charCode || O.keyCode; var N = String.fromCharCode(Q).toLowerCase(); switch (N) {
          case "b":
            L(G.bold); break;
          case "i":
            L(G.italic); break;
          case "l":
            L(G.link); break;
          case "q":
            L(G.quote); break;
          case "k":
            L(G.code); break;
          case "g":
            L(G.image); break;
          case "o":
            L(G.olist); break;
          case "u":
            L(G.ulist); break;
          case "m":
            L(G.more); break;
          case "j":
            L(G.fullscreen); break;
          case "e":
            L(G.exitFullscreen); break;
          case "h":
            L(G.heading); break;
          case "r":
            L(G.hr); break;
          case "y":
            L(G.redo); break;
          case "z":
            if (O.shiftKey) { L(G.redo) } else { L(G.undo) } break;
          default:
            return } if (O.preventDefault) { O.preventDefault() } if (window.event) { window.event.returnValue = false } } else { if (O.keyCode == 9) { var P = {};
          P.textOp = z("doTab");
          L(P); if (O.preventDefault) { O.preventDefault() } if (window.event) { window.event.returnValue = false } } } });
    a.addEvent(C, "keyup", function(O) { if (O.shiftKey && !O.ctrlKey && !O.metaKey) { var P = O.charCode || O.keyCode; if (P === 13) { var N = {};
          N.textOp = z("doAutoindent");
          L(N) } } }); if (v.isIE) { a.addEvent(C, "keydown", function(N) { var O = N.keyCode; if (O === 27) { return false } }) }

    function L(O) { C.focus(); if (O.textOp) { if (M) { M.setCommandMode() } var Q = new b(E); if (!Q) { return } var R = Q.getChunks(); var N = function() { C.focus(); if (R) { Q.setChunks(R) } Q.restore();
          A.refresh() }; var P = O.textOp(R, N); if (!P) { N() } } if (O.execute) { O.execute(M) } }

    function x(N, P) { var Q = "0px"; var S = "-20px"; var O = "-40px"; var R = N.getElementsByTagName("span")[0]; if (P) { R.style.backgroundPosition = N.XShift + " " + Q;
        N.onmouseover = function() { R.style.backgroundPosition = this.XShift + " " + O };
        N.onmouseout = function() { R.style.backgroundPosition = this.XShift + " " + Q }; if (v.isIE) { N.onmousedown = function() { if (w.activeElement && w.activeElement !== E.input) { return } E.ieCachedRange = document.selection.createRange();
            E.ieCachedScrollTop = E.input.scrollTop } } if (!N.isHelp) { N.onclick = function() { if (this.onmouseout) { this.onmouseout() } L(this); return false } } } else { R.style.backgroundPosition = N.XShift + " " + S;
        N.onmouseover = N.onmouseout = N.onclick = function() {} } }

    function z(N) { if (typeof N === "string") { N = J[N] } return function() { N.apply(J, arguments) } }

    function B() { var R = E.buttonBar; var V = "0px"; var Q = "-20px"; var T = "-40px"; var U = document.createElement("ul");
      U.id = "md-button-row" + K;
      U.className = "md-button-row";
      U = R.appendChild(U); var N = 0; var W = function(ad, ab, aa, ac) { var Z = document.createElement("li");
        Z.className = "md-button";
        Z.style.left = N + "px";
        N += 25; var Y = document.createElement("span");
        Z.id = ad + K;
        Z.appendChild(Y);
        Z.title = ab;
        Z.XShift = aa; if (ac) { Z.textOp = ac } x(Z, true);
        U.appendChild(Z); return Z }; var P = function(Z) { var Y = document.createElement("li");
        Y.className = "md-spacer md-spacer" + Z;
        Y.id = "md-spacer" + Z + K;
        U.appendChild(Y);
        N += 25 };
      G.bold = W("md-bold-button", y("bold"), "0px", z("doBold"));
      G.italic = W("md-italic-button", y("italic"), "-20px", z("doItalic"));
      P(1);
      G.link = W("md-link-button", y("link"), "-40px", z(function(Y, Z) { return this.doLinkOrImage(Y, Z, false) }));
      G.quote = W("md-quote-button", y("quote"), "-60px", z("doBlockquote"));
      G.code = W("md-code-button", y("code"), "-80px", z("doCode"));
      G.image = W("md-image-button", y("image"), "-100px", z(function(Y, Z) { return this.doLinkOrImage(Y, Z, true) }));
      P(2);
      G.olist = W("md-olist-button", y("olist"), "-120px", z(function(Y, Z) { this.doList(Y, Z, true) }));
      G.ulist = W("md-ulist-button", y("ulist"), "-140px", z(function(Y, Z) { this.doList(Y, Z, false) }));
      G.heading = W("md-heading-button", y("heading"), "-160px", z("doHeading"));
      G.hr = W("md-hr-button", y("hr"), "-180px", z("doHorizontalRule"));
      G.more = W("md-more-button", y("more"), "-280px", z("doMore"));
      P(3);
      G.undo = W("md-undo-button", y("undo"), "-200px", null);
      G.undo.execute = function(Y) { if (Y) { Y.undo() } }; var X = /win/.test(g.platform.toLowerCase()) ? y("redo") : y("redomac");
      G.redo = W("md-redo-button", X, "-220px", null);
      G.redo.execute = function(Y) { if (Y) { Y.redo() } };
      G.fullscreen = W("md-fullscreen-button", y("fullscreen"), "-240px", null);
      G.fullscreen.execute = function() { I.doFullScreen(G, true) };
      G.exitFullscreen = W("md-exit-fullscreen-button", y("exitFullscreen"), "-260px", null);
      G.exitFullscreen.style.display = "none";
      G.exitFullscreen.execute = function() { I.doFullScreen(G, false) }; if (D) { var S = document.createElement("li"); var O = document.createElement("span");
        S.appendChild(O);
        S.className = "md-button md-help-button";
        S.id = "md-help-button" + K;
        S.XShift = "-300px";
        S.isHelp = true;
        S.style.right = "0px";
        S.title = y("help");
        S.onclick = D.handler;
        x(S, true);
        U.appendChild(S);
        G.help = S } H() }

    function H() { if (M) { x(G.undo, M.canUndo());
        x(G.redo, M.canRedo()) } } this.setUndoRedoButtonStates = H }

  function l(y, x) { this.hooks = y;
    this.getString = x } var f = l.prototype;
  f.prefixes = "(?:\\s{4,}|\\s*>|\\s*-\\s+|\\s*\\d+\\.|=|\\+|-|_|\\*|#|\\s*\\[[^\n]]+\\]:)";
  f.unwrap = function(y) { var x = new n("([^\\n])\\n(?!(\\n|" + this.prefixes + "))", "g");
    y.selection = y.selection.replace(x, "$1 $2") };
  f.wrap = function(y, x) { this.unwrap(y); var A = new n("(.{1," + x + "})( +|$\\n?)", "gm"),
      z = this;
    y.selection = y.selection.replace(A, function(B, C) { if (new n("^" + z.prefixes, "").test(B)) { return B } return C + "\n" });
    y.selection = y.selection.replace(/\s+$/, "") };
  f.doBold = function(x, y) { return this.doBorI(x, y, 2, this.getString("boldexample")) };
  f.doItalic = function(x, y) { return this.doBorI(x, y, 1, this.getString("italicexample")) };
  f.doBorI = function(D, B, C, x) { D.trimWhitespace();
    D.selection = D.selection.replace(/\n{2,}/g, "\n"); var A = /(\**$)/.exec(D.before)[0]; var y = /(^\**)/.exec(D.after)[0]; var E = Math.min(A.length, y.length); if ((E >= C) && (E != 2 || C != 1)) { D.before = D.before.replace(n("[*]{" + C + "}$", ""), "");
      D.after = D.after.replace(n("^[*]{" + C + "}", ""), "") } else { if (!D.selection && y) { D.after = D.after.replace(/^([*_]*)/, "");
        D.before = D.before.replace(/(\s?)$/, ""); var z = n.$1;
        D.before = D.before + y + z } else { if (!D.selection && !y) { D.selection = x } var F = C <= 1 ? "*" : "**";
        D.before = D.before + F;
        D.after = F + D.after } } return };
  f.stripLinkDefs = function(y, x) { y = y.replace(/^[ ]{0,3}\[(\d+)\]:[ \t]*\n?[ \t]*<?(\S+?)>?[ \t]*\n?[ \t]*(?:(\n*)["(](.+?)[")][ \t]*)?(?:\n+|$)/gm, function(C, D, z, A, B) { x[D] = C.replace(/\s*$/, ""); if (A) { x[D] = C.replace(/["(](.+?)[")]$/, ""); return A + B } return "" }); return y };
  f.addLinkDef = function(E, A) { var x = 0; var z = {};
    E.before = this.stripLinkDefs(E.before, z);
    E.selection = this.stripLinkDefs(E.selection, z);
    E.after = this.stripLinkDefs(E.after, z); var y = ""; var D = /(\[)((?:\[[^\]]*\]|[^\[\]])*)(\][ ]?(?:\n[ ]*)?\[)(\d+)(\])/g; var C = function(G) { x++;
      G = G.replace(/^[ ]{0,3}\[(\d+)\]:/, "  [" + x + "]:");
      y += "\n" + G }; var B = function(H, K, I, J, L, G) { I = I.replace(D, B); if (z[L]) { C(z[L]); return K + I + J + x + G } return H };
    E.before = E.before.replace(D, B); if (A) { C(A) } else { E.selection = E.selection.replace(D, B) } var F = x;
    E.after = E.after.replace(D, B); if (E.after) { E.after = E.after.replace(/\n*$/, "") } if (!E.after) { E.selection = E.selection.replace(/\n*$/, "") } E.after += "\n\n" + y; return F };

  function p(x) { return x.replace(/^\s*(.*?)(?:\s+"(.+)")?\s*$/, function(z, y, A) { y = y.replace(/\?.*$/, function(B) { return B.replace(/\+/g, " ") });
      y = decodeURIComponent(y);
      y = encodeURI(y).replace(/'/g, "%27").replace(/\(/g, "%28").replace(/\)/g, "%29");
      y = y.replace(/\?.*$/, function(B) { return B.replace(/\+/g, "%2b") }); if (A) { A = A.trim ? A.trim() : A.replace(/^\s*/, "").replace(/\s*$/, "");
        A = A.replace(/"/g, "quot;").replace(/\(/g, "&#40;").replace(/\)/g, "&#41;").replace(/</g, "&lt;").replace(/>/g, "&gt;") } return A ? y + ' "' + A + '"' : y }) } f.doLinkOrImage = function(x, z, C) { x.trimWhitespace();
    x.findTags(/\s*!?\[/, /\][ ]?(?:\n[ ]*)?(\[.*?\])?/); var y; if (x.endTag.length > 1 && x.startTag.length > 0) { x.startTag = x.startTag.replace(/!?\[/, "");
      x.endTag = "";
      this.addLinkDef(x, null) } else { x.selection = x.startTag + x.selection + x.endTag;
      x.startTag = x.endTag = ""; if (/\n\n/.test(x.selection)) { this.addLinkDef(x, null); return } var A = this; var B = function(G) { y.parentNode.removeChild(y); if (G !== null) { x.selection = (" " + x.selection).replace(/([^\\](?:\\\\)*)(?=[[\]])/g, "$1\\").substr(1); var F = " [999]: " + p(G); var E = A.addLinkDef(x, F);
          x.startTag = C ? "![" : "[";
          x.endTag = "][" + E + "]"; if (!x.selection) { if (C) { var H = A.getString("imagename"); if (!!H) { H = H.replace(/_/g, "\\_") } x.selection = H || A.getString("imagedescription") } else { var D = A.getString("linkname"); if (!!D) { D = D.replace(/_/g, "\\_") } x.selection = D || A.getString("linkdescription") } } } z() };
      y = m.createBackground(); if (C) { if (!this.hooks.insertImageDialog(B)) { m.prompt(this.getString("imagedialog"), c, B, this.getString("ok"), this.getString("cancel")) } } else { if (!this.hooks.insertLinkDialog(B)) { m.prompt(this.getString("linkdialog"), d, B, this.getString("ok"), this.getString("cancel")) } } return true } };
  f.doAutoindent = function(z, A) { var y = this,
      x = false;
    z.before = z.before.replace(/(\n|^)[ ]{0,3}([*+-]|\d+[.])[ \t]*\n$/, "\n\n");
    z.before = z.before.replace(/(\n|^)[ ]{0,3}>[ \t]*\n$/, "\n\n");
    z.before = z.before.replace(/(\n|^)[ \t]+\n$/, "\n\n"); if (!z.selection && !/^[ \t]*(?:\n|$)/.test(z.after)) { z.after = z.after.replace(/^[^\n]*/, function(B) { z.selection = B; return "" });
      x = true } if (/(\n|^)[ ]{0,3}([*+-]|\d+[.])[ \t]+.*\n$/.test(z.before)) { if (y.doList) { y.doList(z) } } if (/(\n|^)[ ]{0,3}>[ \t]+.*\n$/.test(z.before)) { if (y.doBlockquote) { y.doBlockquote(z) } } if (/(\n|^)(\t|[ ]{4,}).*\n$/.test(z.before)) { if (y.doCode) { y.doCode(z) } } if (x) { z.after = z.selection + z.after;
      z.selection = "" } };
  f.doBlockquote = function(E, z) { E.selection = E.selection.replace(/^(\n*)([^\r]+?)(\n*)$/, function(K, J, I, H) { E.before += J;
      E.after = H + E.after; return I });
    E.before = E.before.replace(/(>[ \t]*)$/, function(I, H) { E.selection = H + E.selection; return "" });
    E.selection = E.selection.replace(/^(\s|>)+$/, "");
    E.selection = E.selection || this.getString("quoteexample"); var D = "",
      C = "",
      F; if (E.before) { var G = E.before.replace(/\n$/, "").split("\n"); var B = false; for (var A = 0; A < G.length; A++) { var y = false;
        F = G[A];
        B = B && F.length > 0; if (/^>/.test(F)) { y = true; if (!B && F.length > 1) { B = true } } else { if (/^[ \t]*$/.test(F)) { y = true } else { y = B } } if (y) { D += F + "\n" } else { C += D + F;
          D = "\n" } } if (!/(^|\n)>/.test(D)) { C += D;
        D = "" } } E.startTag = D;
    E.before = C; if (E.after) { E.after = E.after.replace(/^\n?/, "\n") } E.after = E.after.replace(/^(((\n|^)(\n[ \t]*)*>(.+\n)*.*)+(\n[ \t]*)*)/, function(H) { E.endTag = H; return "" }); var x = function(I) { var H = I ? "> " : ""; if (E.startTag) { E.startTag = E.startTag.replace(/\n((>|\s)*)\n$/, function(K, J) { return "\n" + J.replace(/^[ ]{0,3}>?[ \t]*$/gm, H) + "\n" }) } if (E.endTag) { E.endTag = E.endTag.replace(/^\n((>|\s)*)\n/, function(K, J) { return "\n" + J.replace(/^[ ]{0,3}>?[ \t]*$/gm, H) + "\n" }) } }; if (/^(?![ ]{0,3}>)/m.test(E.selection)) { this.wrap(E, q.lineLength - 2);
      E.selection = E.selection.replace(/^/gm, "> ");
      x(true);
      E.skipLines() } else { E.selection = E.selection.replace(/^[ ]{0,3}> ?/gm, "");
      this.unwrap(E);
      x(false); if (!/^(\n|^)[ ]{0,3}>/.test(E.selection) && E.startTag) { E.startTag = E.startTag.replace(/\n{0,2}$/, "\n\n") } if (!/(\n|^)[ ]{0,3}>.*$/.test(E.selection) && E.endTag) { E.endTag = E.endTag.replace(/^\n{0,2}/, "\n\n") } } E.selection = this.hooks.postBlockquoteCreation(E.selection); if (!/\n/.test(E.selection)) { E.selection = E.selection.replace(/^(> *)/, function(H, I) { E.startTag += I; return "" }) } };
  f.doCode = function(x, y) { var A = /\S[ ]*$/.test(x.before); var C = /^[ ]*\S/.test(x.after); if ((!C && !A) || /\n/.test(x.selection)) { x.before = x.before.replace(/[ ]{4}$/, function(D) { x.selection = D + x.selection; return "" }); var B = 1; var z = 1; if (/(\n|^)(\t|[ ]{4,}).*\n$/.test(x.before)) { B = 0 } if (/^\n(\t|[ ]{4,})/.test(x.after)) { z = 0 } x.skipLines(B, z); if (!x.selection) { x.startTag = "    ";
        x.selection = this.getString("codeexample") } else { if (/^[ ]{0,3}\S/m.test(x.selection)) { if (/\n/.test(x.selection)) { x.selection = x.selection.replace(/^/gm, "    ") } else { x.before += "    " } } else { x.selection = x.selection.replace(/^(?:[ ]{4}|[ ]{0,3}\t)/gm, "") } } } else { x.trimWhitespace();
      x.findTags(/`/, /`/); if (!x.startTag && !x.endTag) { x.startTag = x.endTag = "`"; if (!x.selection) { x.selection = this.getString("codeexample") } } else { if (x.endTag && !x.startTag) { x.before += x.endTag;
          x.endTag = "" } else { x.startTag = x.endTag = "" } } } };
  f.doList = function(I, B, A) { var K = /(\n|^)(([ ]{0,3}([*+-]|\d+[.])[ \t]+.*)(\n.+|\n{2,}([*+-].*|\d+[.])[ \t]+.*|\n{2,}[ \t]+\S.*)*)\n*$/; var J = /^\n*(([ ]{0,3}([*+-]|\d+[.])[ \t]+.*)(\n.+|\n{2,}([*+-].*|\d+[.])[ \t]+.*|\n{2,}[ \t]+\S.*)*)\n*/; var x = "-"; var F = 1; var D = function() { var L; if (A) { L = " " + F + ". ";
        F++ } else { L = " " + x + " " } return L }; var E = function(L) { if (A === undefined) { A = /^\s*\d/.test(L) } L = L.replace(/^[ ]{0,3}([*+-]|\d+[.])\s/gm, function(M) { return D() }); return L };
    I.findTags(/(\n|^)*[ ]{0,3}([*+-]|\d+[.])\s+/, null); if (I.before && !/\n$/.test(I.before) && !/^\n/.test(I.startTag)) { I.before += I.startTag;
      I.startTag = "" } if (I.startTag) { var z = /\d+[.]/.test(I.startTag);
      I.startTag = "";
      I.selection = I.selection.replace(/\n[ ]{4}/g, "\n");
      this.unwrap(I);
      I.skipLines(); if (z) { I.after = I.after.replace(J, E) } if (A == z) { return } } var C = 1;
    I.before = I.before.replace(K, function(L) { if (/^\s*([*+-])/.test(L)) { x = n.$1 } C = /[^\n]\n\n[^\n]/.test(L) ? 1 : 0; return E(L) }); if (!I.selection) { I.selection = this.getString("litem") } var G = D(); var y = 1;
    I.after = I.after.replace(J, function(L) { y = /[^\n]\n\n[^\n]/.test(L) ? 1 : 0; return E(L) });
    I.trimWhitespace(true);
    I.skipLines(C, y, true);
    I.startTag = G; var H = G.replace(/./g, " ");
    this.wrap(I, q.lineLength - H.length);
    I.selection = I.selection.replace(/\n/g, "\n" + H) };
  f.doHeading = function(z, A) { z.selection = z.selection.replace(/\s+/g, " ");
    z.selection = z.selection.replace(/(^\s+|\s+$)/g, ""); if (!z.selection) { z.startTag = "## ";
      z.selection = this.getString("headingexample");
      z.endTag = " ##"; return } var B = 0;
    z.findTags(/#+[ ]*/, /[ ]*#+/); if (/#+/.test(z.startTag)) { B = n.lastMatch.length } z.startTag = z.endTag = "";
    z.findTags(null, /\s?(-+|=+)/); if (/=+/.test(z.endTag)) { B = 1 } if (/-+/.test(z.endTag)) { B = 2 } z.startTag = z.endTag = "";
    z.skipLines(1, 1); var C = B == 0 ? 2 : B - 1; if (C > 0) { var y = C >= 2 ? "-" : "="; var x = z.selection.length; if (x > q.lineLength) { x = q.lineLength } z.endTag = "\n"; while (x--) { z.endTag += y } } };
  f.doHorizontalRule = function(x, y) { x.startTag = "----------\n";
    x.selection = "";
    x.skipLines(2, 1, true) };
  f.doMore = function(x, y) { x.startTag = "<!--more-->\n\n";
    x.selection = "";
    x.skipLines(2, 0, true) };
  f.doTab = function(x, y) { x.startTag = "    ";
    x.selection = "" };

  function o(x, y) { this.fullScreenBind = false;
    this.hooks = x;
    this.getString = y;
    this.isFakeFullScreen = false }

  function j() { var y = { fullScreenChange: ["onfullscreenchange", "onwebkitfullscreenchange", "onmozfullscreenchange", "onmsfullscreenchange"], requestFullscreen: ["requestFullscreen", "webkitRequestFullScreen", "mozRequestFullScreen", "msRequestFullScreen"], cancelFullscreen: ["cancelFullscreen", "exitFullScreen", "webkitCancelFullScreen", "mozCancelFullScreen", "msCancelFullScreen"] },
      z = {}; for (var A in y) { var x = y[A].length,
        C = false; for (var B = 0; B < x; B++) { var D = y[A][B]; if ("undefined" != typeof(document[D]) || "undefined" != typeof(document.body[D])) { z[A] = D;
          C = true; break } } if (!C) { return false } } return z }

  function r() { return document.fullScreen || document.mozFullScreen || document.webkitIsFullScreen || document.msIsFullScreen } o.prototype.doFullScreen = function(z, A) { var x = j(),
      y = this; if (!x) { alert(y.getString("fullscreenUnsupport")); return false } if (!this.fullScreenBind) { a.addEvent(document, x.fullScreenChange.substring(2), function() { if (!r()) { z.fullscreen.style.display = "";
          z.exitFullscreen.style.display = "none";
          y.hooks.exitFullScreen() } else { z.fullscreen.style.display = "none";
          z.exitFullscreen.style.display = "";
          y.hooks.enterFullScreen() } });
      this.fullScreenBind = true } if (A) { if (y.isFakeFullScreen) { document.body[x.requestFullscreen]("webkitRequestFullScreen" == x.requestFullscreen ? Element.ALLOW_KEYBOARD_INPUT : null);
        y.isFakeFullScreen = false } else { if (!r()) { z.exitFullscreen.style.display = "";
          y.hooks.enterFakeFullScreen();
          y.isFakeFullScreen = true } } } else { if (y.isFakeFullScreen) { z.exitFullscreen.style.display = "none";
        y.hooks.exitFullScreen() } else { if (r()) { document[x.cancelFullscreen]() } } y.isFakeFullScreen = false } } })();