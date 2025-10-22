#!/usr/bin/env fish

set -l group_mode 0

# Check if -g flag is set
if test "$argv[1]" = '-g'
    set group_mode 1
    set dispatcher $argv[2]
    set workspace $argv[3]
else
    set dispatcher $argv[1]
    set workspace $argv[2]
end

if test -z "$dispatcher" -o -z "$workspace"
    echo 'Wrong number of arguments. Usage: ./wsaction.fish [-g] <dispatcher> <workspace>'
    exit 1
end

set -l active_ws (hyprctl activeworkspace -j | jq -r '.id')

if test $group_mode -eq 1
    # Jump to workspace group
    set target (math "($workspace - 1) * 10 + $active_ws % 10")
else
    # Jump to workspace within current group
    set target (math "floor(($active_ws - 1) / 10) * 10 + $workspace")
end

hyprctl dispatch $dispatcher $target


