if [ -n "$BASH_VERSION" ]; then
    for file in ~/.{bash_prompt,bashrc}; do
        [ -r "$file" ] && [ -f "$file" ] && source "$file";
    done;

fi

if which brew &> /dev/null && [ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]; then
	# Ensure existing Homebrew v1 completions continue to work
	export BASH_COMPLETION_COMPAT_DIR="$(brew --prefix)/etc/bash_completion.d";
	source "$(brew --prefix)/etc/profile.d/bash_completion.sh";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;


export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:/usr/local/texlive/2024/bin/x86_64-linux"
export PATH="$PATH:/home/aaron/ch-linux-amd64"
export PATH="$PATH:/opt/idea-IU-243.22562.218/bin"
export PATH="$PATH:/opt/PhpStorm-243.22562.233/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:/opt/cisco/anyconnect/bin"
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --info=inline-right \
  --ansi \
  --layout=reverse \
  --border=none
  --color=bg+:#2e3c64 \
  --color=bg:#1f2335 \
  --color=border:#29a4bd \
  --color=fg:#c0caf5 \
  --color=gutter:#1f2335 \
  --color=header:#ff9e64 \
  --color=hl+:#2ac3de \
  --color=hl:#2ac3de \
  --color=info:#545c7e \
  --color=marker:#ff007c \
  --color=pointer:#ff007c \
  --color=prompt:#2ac3de \
  --color=query:#c0caf5:regular \
  --color=scrollbar:#29a4bd \
  --color=separator:#ff9e64 \
  --color=spinner:#ff007c \
"
