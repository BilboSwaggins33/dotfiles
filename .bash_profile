if [ -n "$BASH_VERSION" ]; then
    for file in ~/.{bashrc,bash_prompt}; do
        [ -r "$file" ] && [ -f "$file" ] && source "$file";
    done;

fi

export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:/usr/local/texlive/2024/bin/x86_64-linux"
export PATH="$PATH:/home/aaron/ch-linux-amd64"
export PATH="$PATH:/opt/idea-IU-243.22562.218/bin"
export PATH="$PATH:/opt/PhpStorm-243.22562.233/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:/opt/cisco/anyconnect/bin"
