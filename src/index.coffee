dateReg        = /^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}(?:\.\d*)(?:Z|(\+|-)[\d|:]*)?$/
module.exports = (key, val)->
	return val if typeof val isnt "string"
	switch val
		when "" then val
		when "null" then null
		when "undefined" then undefined
		when "true", "yes", "on" then true
		when "false", "no", "off" then false
		else switch
			when isFinite(val) then Number(val)
			when dateReg.test(val) then new Date(val)
			else val