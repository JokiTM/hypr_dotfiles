------------------
---- MONITORS ----
------------------



-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
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



