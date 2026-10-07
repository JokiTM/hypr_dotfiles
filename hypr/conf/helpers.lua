---------------------
------ SCRIPTS ------
---------------------

local M  = {}

function M.isSet(v)
    local env = os.getenv(v)
    return env ~= nil
end

function M.exec(cmd)
    hl.dispatch(hl.dsp.exec_cmd(cmd))
end

function M.dispatchTerminalApp(cmd)
    M.exec("pkill " .. cmd .. " || foot -T " .. cmd .. " zsh -c '~/.config/hypr/scripts/dispatch.sh " .. cmd .. "'")
end

return M
