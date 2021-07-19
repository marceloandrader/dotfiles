set -gx EDITOR nvim
set -gx TERM screen-256color
starship init fish | source
complete -c remote -a "(fd  . ~/.password-store/ | sed 's/\/home\/marcelo\/\.password-store\///g' | sed 's/\.gpg//g')"
source ~/.asdf/asdf.fish

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[ -f /home/marcelo/Code/toptal/SmithCarson/sc-source/scrape-bot/node_modules/tabtab/.completions/electron-forge.fish ]; and . /home/marcelo/Code/toptal/SmithCarson/sc-source/scrape-bot/node_modules/tabtab/.completions/electron-forge.fish
