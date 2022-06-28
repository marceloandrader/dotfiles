set -gx EDITOR nvim
set -gx TERM screen-256color
starship init fish | source
complete -c remote -a "(fd  . ~/.password-store/ | sed 's/\/home\/marcelo\/\.password-store\///g' | sed 's/\.gpg//g')"
source ~/.asdf/asdf.fish
eval (dircolors ~/.dir_colors/dircolors | head -n 1 | sed 's/^LS_COLORS=/set -x LS_COLORS /;s/;$//')
export PATH="/home/marcelo/.local/share/solana/install/active_release/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="/home/marcelo/.local/bin:$PATH"
export PATH="/home/marcelo/bin/ddev:$PATH"
export FLYCTL_INSTALL="/home/marcelo/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[ -f /home/marcelo/Code/toptal/SmithCarson/sc-source/scrape-bot/node_modules/tabtab/.completions/electron-forge.fish ]; and . /home/marcelo/Code/toptal/SmithCarson/sc-source/scrape-bot/node_modules/tabtab/.completions/electron-forge.fish
