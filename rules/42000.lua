-- SQLi Signatures

local _M = {}

_M.version = "0.4"

local _rules = {
	{
		id = 42001,
		var = {
			type = "REQUEST_ARGS",
			opts = { key = "all" },
			pattern = { "jscript", "onsubmit", "copyparentfolder", "document", "javascript", "meta", "onchange", "onmove", "onkeydown", "onkeyup", "activexobject", "onerror", "onmouseup", "ecmascript", "bexpression", "onmouseover", "vbscript:", "<![cdata[", "http:", ".innerhtml", "settimeout", "shell:", "onabort", "asfunction:", "onkeypress", "onmousedown", "onclick", ".fromcharcode", "background-image:", "x-javascript", "ondragdrop", "onblur", "mocha:", "javascript:", "onfocus", "lowsrc", "getparentfolder", "onresize", "@import", "alert", "script", "onselect", "onmouseout", "application", "onmousemove", "background", ".execscript", "livescript:", "vbscript", "getspecialfolder", ".addimport", "iframe", "onunload", "createtextrange", "<input", "onload" },
			operator = "NOT_PM"
		},
		opts = { nolog = true },
		action = "SKIP",
		description = "Preliminary XSS check"
	},
	{
		id = 42002,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\bgetparentfolder\\b",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42003,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\bonmousedown\\b\\W*?\\=",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42004,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\bsrc\\b\\W*?\\bshell:",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42005,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\bmocha:",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42006,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\bonabort\\b",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42007,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\blowsrc\\b\\W*?\\bhttp:",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42008,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\bonmouseup\\b\\W*?\\=",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42009,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\bstyle\\b\\W*\\=.*bexpression\\b\\W*\\(",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42010,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\bhref\\b\\W*?\\bshell:",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42011,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\bcreatetextrange\\b",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42012,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\bondragdrop\\b\\W*?\\=",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42013,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\bcopyparentfolder\\b",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42014,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\bonunload\\b\\W*?\\=",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42015,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\.execscript\\b",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42016,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\bgetspecialfolder\\b",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42017,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "<body\\b.*?\\bonload\\b",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42018,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\burl\\b\\W*?\\bvbscript:",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42019,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\bonkeydown\\b\\W*?\\=",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42020,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\bonmousemove\\b\\W*?\\=",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42021,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\blivescript:",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42022,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\bonblur\\b\\W*?\\=",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42023,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\bonmove\\b\\W*?\\=",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42024,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\bsettimeout\\b\\W*?\\(",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42025,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "< ?iframe",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42026,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\bsrc\\b\\W*?\\bjavascript:",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42027,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "<body\\b.*?\\bbackground\\b",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42028,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\bsrc\\b\\W*?\\bvbscript:",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42029,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\btype\\b\\W*?\\btext\\b\\W*?\\becmascript\\b",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42030,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\bonfocus\\b\\W*?\\=",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42031,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\bdocument\\b\\s*\\.\\s*\\bcookie\\b",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42032,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\<\\!\\[cdata\\[",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42033,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\bonerror\\b\\W*?\\=",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42034,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\blowsrc\\b\\W*?\\bjavascript:",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42035,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\bactivexobject\\b",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42036,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\bonkeypress\\b\\W*?\\=",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42037,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\bonsubmit\\b\\W*?\\=",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42038,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\btype\\b\\W*?\\bapplication\\b\\W*?\\bx-javascript\\b",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42039,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\.addimport\\b",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42040,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\bhref\\b\\W*?\\bjavascript:",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42041,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\bonchange\\b\\W*?\\=",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42043,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\btype\\b\\W*?\\btext\\b\\W*?\\bjscript\\b",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42043,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\balert\\b\\W*?\\(",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42044,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\btype\\b\\W*?\\bapplication\\b\\W*?\\bx-vbscript\\b",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42045,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "< ?meta",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42046,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\bsrc\\b\\W*?\\bhttp:",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42047,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\btype\\b\\W*?\\btext\\b\\W*?\\bvbscript\\b",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42048,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\bonmouseout\\b\\W*?\\=",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42049,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\blowsrc\\b\\W*?\\bshell:",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42050,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\basfunction:",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42051,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\bonmouseover\\b\\W*?\\=",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42052,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\bhref\\b\\W*?\\bvbscript:",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42053,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\burl\\b\\W*?\\bjavascript:",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42054,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\.innerhtml\\b",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42055,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\bonselect\\b\\W*?\\=",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42056,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\import\\b",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42057,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\blowsrc\\b\\W*?\\bvbscript:",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42058,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\bonload\\b\\W*?\\=",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42059,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "< ?script\\b",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42060,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\bonresize\\b\\W*?\\=",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42061,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\bonclick\\b\\W*?\\=",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42062,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\biframe\\b.{0,100}?\\bsrc\\b",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42063,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\bbackground-image:",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42064,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\bonkeyup\\b\\W*?\\=",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42065,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "<input\\b.*?\\btype\\b\\W*?\\bimage\\b",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42066,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\burl\\b\\W*?\\bshell:",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42067,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\btype\\b\\W*?\\btext\\b\\W*?\\bjavascript\\b",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42068,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { skipend = true, score = 4 },
		var = {
			operator = "REGEX",
			pattern = "\\.fromcharcode\\b",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42069,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting) - HTML Tag Handler",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "<(a|abbr|acronym|address|applet|area|audioscope|b|base|basefront|bdo|bgsound|big|blackface|blink|blockquote|body|bq|br|button|caption|center|cite|code|col|colgroup|comment|dd|del|dfn|dir|div|dl|dt|em|embed|fieldset|fn|font|form|frame|frameset|h1|head|hr|html|i|iframe|ilayer|img|input|ins|isindex|kdb|keygen|label|layer|legend|li|limittext|link|listing|map|marquee|menu|meta|multicol|nobr|noembed|noframes|noscript|nosmartquotes|object|ol|optgroup|option|p|param|plaintext|pre|q|rt|ruby|s|samp|script|select|server|shadow|sidebar|small|spacer|span|strike|strong|style|sub|sup|table|tbody|td|textarea|tfoot|th|thead|title|tr|tt|u|ul|var|wbr|xml|xmp)\\W",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42070,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\ballowscriptaccess\\b|\\brel\\b\\W*?=",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42071,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = ".+application/x-shockwave-flash|image/svg\\+xml|text/(css|html|ecmascript|javascript|vbscript|x-(javascript|scriptlet|vbscript)).+",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42072,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\bon(abort|blur|change|click|dblclick|dragdrop|error|focus|keydown|keypress|keyup|load|mousedown|mousemove|mouseout|mouseover|mouseup|move|readystatechange|reset|resize|select|submit|unload)\\b\\W*?=",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42073,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\b(background|dynsrc|href|lowsrc|src)\\b\\W*?=",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42074,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "(asfunction|javascript|vbscript|data|mocha|livescript):",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42075,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting) - Style Tag Manipulation",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\\bstyle\\b\\W*?=",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42076,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting) - JS Fragments",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "(fromcharcode|alert|eval)\\s*\\(",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42077,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting) - CSS Fragments",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "background\\b\\W*?:\\W*?url|background-image\\b\\W*?:|behavior\\b\\W*?:\\W*?url|-moz-binding\\b|@import\\b|expression\\b\\W*?\\(",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42078,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "<!\\[cdata\\[|\\]\\]>",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42079,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting) - xss testing alert",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "[/'\\\"<]xss[/'\\\">]",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42080,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting) - ASCII alert",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "(88,83,83)",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42081,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting) - xss testing alert",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "'';!--\\\"<xss>=&{()}",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42082,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting)",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "\"<!(doctype|entity)",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42083,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting) - IE Filter",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "(?:<script.*?>)",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42084,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting) - IE Filter",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "(?:<style.*?>.*?((@[i\\\\\\\\])|(([:=]|(&#x?0*((58)|(3A)|(61)|(3D));?)).*?([(\\\\\\\\]|(&#x?0*((40)|(28)|(92)|(5C));?)))))",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42085,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting) - IE Filter",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = [=[(?:<script.*?[ /+\t]*?((src)|(xlink:href)|(href))[ /+\t]*=)]=],
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42086,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting) - IE Filter",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = [=[(?:<[i]?frame.*?[ /+\t]*?src[ /+\t]*=)]=],
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42087,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting) - IE Filter",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = [=[(?i:<.*[:]vmlframe.*?[ /+\t]*?src[ /+\t]*=)]=],
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42088,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting) - IE Filter",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "(?:(j|(&#x?0*((74)|(4A)|(106)|(6A));?))([\\t]|(&((#x?0*(9|(13)|(10)|A|D);?)|(tab;)|(newline;))))*(a|(&#x?0*((65)|(42)|(97)|(61));?))([\\t]|(&((#x?0*(9|(13)|(10)|A|D);?)|(tab;)|(newline;))))*(v|(&#x?0*((86)|(56)|(118)|(76));?))([\\t]|(&((#x?0*(9|(13)|(10)|A|D);?)|(tab;)|(newline;))))*(a|(&#x?0*((65)|(42)|(97)|(61));?))([\\t]|(&((#x?0*(9|(13)|(10)|A|D);?)|(tab;)|(newline;))))*(s|(&#x?0*((83)|(53)|(115)|(73));?))([\\t]|(&((#x?0*(9|(13)|(10)|A|D);?)|(tab;)|(newline;))))*(c|(&#x?0*((67)|(43)|(99)|(63));?))([\\t]|(&((#x?0*(9|(13)|(10)|A|D);?)|(tab;)|(newline;))))*(r|(&#x?0*((82)|(52)|(114)|(72));?))([\\t]|(&((#x?0*(9|(13)|(10)|A|D);?)|(tab;)|(newline;))))*(i|(&#x?0*((73)|(49)|(105)|(69));?))([\\t]|(&((#x?0*(9|(13)|(10)|A|D);?)|(tab;)|(newline;))))*(p|(&#x?0*((80)|(50)|(112)|(70));?))([\\t]|(&((#x?0*(9|(13)|(10)|A|D);?)|(tab;)|(newline;))))*(t|(&#x?0*((84)|(54)|(116)|(74));?))([\\t]|(&((#x?0*(9|(13)|(10)|A|D);?)|(tab;)|(newline;))))*(:|(&((#x?0*((58)|(3A));?)|(colon;)))).)",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42089,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting) - IE Filter",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "(?:(v|(&#x?0*((86)|(56)|(118)|(76));?))([\\t]|(&((#x?0*(9|(13)|(10)|A|D);?)|(tab;)|(newline;))))*(b|(&#x?0*((66)|(42)|(98)|(62));?))([\\t]|(&((#x?0*(9|(13)|(10)|A|D);?)|(tab;)|(newline;))))*(s|(&#x?0*((83)|(53)|(115)|(73));?))([\\t]|(&((#x?0*(9|(13)|(10)|A|D);?)|(tab;)|(newline;))))*(c|(&#x?0*((67)|(43)|(99)|(63));?))([\\t]|(&((#x?0*(9|(13)|(10)|A|D);?)|(tab;)|(newline;))))*(r|(&#x?0*((82)|(52)|(114)|(72));?))([\\t]|(&((#x?0*(9|(13)|(10)|A|D);?)|(tab;)|(newline;))))*(i|(&#x?0*((73)|(49)|(105)|(69));?))([\\t]|(&((#x?0*(9|(13)|(10)|A|D);?)|(tab;)|(newline;))))*(p|(&#x?0*((80)|(50)|(112)|(70));?))([\\t]|(&((#x?0*(9|(13)|(10)|A|D);?)|(tab;)|(newline;))))*(t|(&#x?0*((84)|(54)|(116)|(74));?))([\\t]|(&((#x?0*(9|(13)|(10)|A|D);?)|(tab;)|(newline;))))*(:|(&((#x?0*((58)|(3A));?)|(colon;)))).)",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42090,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting) - IE Filter",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "(?:<EMBED /+\\t].*?((src)|(type)).*?=)",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42091,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting) - IE Filter",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "(?:<[?]?import /+\\t].*?implementation[ /+\\t]*=)",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42092,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting) - IE Filter",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "(?:<META /+\\t].*?http-equiv[ /+\\t]*=[ /+\\t]*[\\\"\\'`]?(((c|(&#x?0*((67)|(43)|(99)|(63));?)))|((r|(&#x?0*((82)|(52)|(114)|(72));?)))|((s|(&#x?0*((83)|(53)|(115)|(73));?)))))",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42093,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting) - IE Filter",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "(?:<META /+\\t].*?charset[ /+\\t]*=)",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42094,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting) - IE Filter",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "(?:<LINK /+\\t].*?href[ /+\\t]*=)",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42095,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting) - IE Filter",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "(?:<BASE /+\\t].*?href[ /+\\t]*=)",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42096,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting) - IE Filter",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "(?:<APPLET /+\\t>])",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
	{
		id = 42097,
		action = "SCORE",
		description = "XSS (Cross-Site Scripting) - IE Filter",
		opts = { score = 4, transform = { 'html_decode', 'compress_whitespace' } },
		var = {
			operator = "REGEX",
			pattern = "(?:<OBJECT /+\\t].*?((type)|(codetype)|(classid)|(code)|(data))[ /+\\t]*=)",
			type = "REQUEST_ARGS",
			opts = { key = "all" },
		},
	},
}

function _M.rules()
	return _rules
end

return _M
