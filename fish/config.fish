set -gx EDITOR nvim
set -gx TERM screen-256color
starship init fish | source
complete -c remote -a "(fd  . ~/.password-store/ | sed 's/\/home\/marcelo\/\.password-store\///g' | sed 's/\.gpg//g')"
# source ~/.asdf/asdf.fish
# eval (dircolors ~/.dir_colors/dircolors | head -n 1 | sed 's/^LS_COLORS=/set -x LS_COLORS /;s/;$//')
export PATH="/home/marcelo/.local/bin:$PATH"
export PATH="./node_modules/.bin/:$PATH"
export PATH="./vendor/bin:$PATH"
export PATH="/home/marcelo/.config/composer/vendor/bin:$PATH"

mise activate fish | source

# Start SSH agent automatically
if not ps -p $SSH_AGENT_PID &>/dev/null
    eval (ssh-agent -c)
    set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
    set -Ux SSH_AGENT_PID $SSH_AGENT_PID
end

# Add your SSH key (change path if needed)
SSH_ASKPASS_REQUIRE=force SSH_ASKPASS=~/.ssh/askpass-pass.sh ssh-add ~/.ssh/id_ed25519 &>/dev/null
ssh-add ~/.ssh/new-logistico-key.pem &>/dev/null
ssh-add ~/.ssh/smithcarson-prod.pem &>/dev/null
ssh-add ~/.ssh/SmithCarson.pem &>/dev/null

# opencode
fish_add_path /home/marcelo/.opencode/bin
# kilo
fish_add_path /home/marcelo/.kilo/bin

eval (try init ~/Work/tries | string collect)
