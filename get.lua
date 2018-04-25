
--[[

	keys: "hex", "now"
	argv: hex, nano


	reply: exist, val, rc, access, create, user
]]--

local hex = ARGV[1];
local now = ARGV[2];

local exist = redis.call("HEXISTS", hex, "access");

if exist == 0 then
	return {0, false, false, false, false, false};
end

local object = redis.call("HMGET", hex,
	"val",
	"rc",
	"access",
	"create",
	"user");

redis.call("HSET", hex, "access", now);

return {
	1,
	object[1], -- val
	object[2], -- rc
	object[3], -- access
	object[4], -- create
	object[5]  --.user
};
