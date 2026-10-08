------------------
---- MONITORS ----
------------------

local helpers = require('conf/helpers')

local laptop = helpers.isSet("LAPTOP")

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
if not laptop then
    hl.monitor({
        output   = "DP-3",
        mode     = "2560x1440@180",
        position = "1920x0",
        scale    = "1",
        disabled = false,
    })

    hl.monitor({
        output   = "DP-1",
        mode     = "1920x1080@60",
        position = "0x0",
        scale    = "1",
    })
end

if laptop then
    hl.monitor({
        output   = "eDP-1",
        mode     = "1920x1080@60.05",
        position = "0x0",
        scale    = "1",
    })
    -- Uni Projektor
    hl.monitor({
        output   = "",
        scale    = "1",
        position = "auto",
        mirror   = "eDP-1",
    })
end



