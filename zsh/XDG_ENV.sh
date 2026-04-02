export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_STATE_HOME=$HOME/.local/state
export XDG_DATA_HOME=$HOME/.local/share


# rust
export CARGO_HOME="$XDG_DATA_HOME"/cargo

# java
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java

# wget
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
