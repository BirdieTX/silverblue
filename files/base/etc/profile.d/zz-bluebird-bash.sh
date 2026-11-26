# Allows running cargo commands/packages in BASH.
case ":$PATH:" in *":$HOME/.cargo/bin:"*) ;; *) PATH="$HOME/.cargo/bin:$PATH" ;; esac
export PATH

# Adds starship to BASH.
if [ -n "$BASH_VERSION" ] && [[ $- == *i* ]]; then
    eval "$(starship init bash)"
fi