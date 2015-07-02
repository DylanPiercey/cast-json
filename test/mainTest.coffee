assert  = require("assert")
details = require("../package.json")
parse   = require("../src")

describe "#{details.name}@#{details.version}", ->
	transforms = [
		["",                         ""]
		["null",                     null]
		["undefined",                undefined]
		["true",                     true]
		["yes",                      true]
		["on",                       true]
		["false",                    false]
		["no",                       false]
		["off",                      false]
		["1",                        1]
		["1.1",                      1.1]
		["h1",                       "h1"]
		["2015-07-02T21:57:21.089Z", 1435874241089]
		[(obj = {}),                 obj]
		[(arr = []),                 arr]
		[(fn  = ->),                 fn]
		[(reg = /.*/),               reg]
		[(date = new Date()),        date.valueOf()]
	]
	it "should cast values", ->
		for [a, b] in transforms
			parsed = parse(null, a)
			parsed = parsed.valueOf() if parsed and typeof parsed is "object"
			assert.equal(parsed, b)