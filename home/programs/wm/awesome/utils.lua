local M = {}

local function path_from_home(path)
	path = path or ""
	local HOME = os.getenv("HOME")

	return HOME .. path
end

M.path_from_home = path_from_home

return M
