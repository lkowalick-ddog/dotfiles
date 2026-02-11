if [[ "$(uname)" == "Darwin" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"

    export HOMEBREW_NO_INSECURE_REDIRECT=1
    export HOMEBREW_CASK_OPTS=--require-sha
    export HOMEBREW_DIR=/opt/homebrew
    export HOMEBREW_BIN=/opt/homebrew/bin

    export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
    eval "$(dd-gitsign load-key)"

    export GITLAB_TOKEN=$(security find-generic-password -a ${USER} -s gitlab_token -w)
fi

# Add datadog devtools binaries to the PATH
export PATH="$HOME/dd/devtools/bin:$PATH"

# Point GOPATH to our go sources
export GOPATH="$HOME/go"

# Add binaries that are go install-ed to PATH
export PATH="$GOPATH/bin:$PATH"

# Point DATADOG_ROOT to ~/dd symlink
export DATADOG_ROOT="$HOME/dd"

# Tell the devenv vm to mount $GOPATH/src rather than just dd-go
export MOUNT_ALL_GO_SRC=1

# store key in the login keychain instead of aws-vault managing a hidden keychain
export AWS_VAULT_KEYCHAIN_NAME=login

# tweak session times so you don't have to re-enter passwords every 5min
export AWS_SESSION_TTL=24h
export AWS_ASSUME_ROLE_TTL=1h

# Helm switch from storing objects in kubernetes configmaps to
# secrets by default, but we still use the old default.
export HELM_DRIVER=configmap

# Go 1.16+ sets GO111MODULE to off by default with the intention to
# remove it in Go 1.18, which breaks projects using the dep tool.
# https://blog.golang.org/go116-module-changes
export GO111MODULE=auto
# Configure Go to pull go.ddbuild.io packages.
export GONOSUMDB=github.com/DataDog,go.ddbuild.io
export GOPRIVATE=
export GOPROXY="https://depot-read-api-go.us1.ddbuild.io/magicmirror/magicmirror/@current/|https://depot-read-api-go.us1.ddbuild.io/magicmirror/magicmirror/@current/|https://depot-read-api-go.us1.ddbuild.io/magicmirror/testing/@current/"
# END ANSIBLE MANAGED BLOCK


# Personal Additions

source "$HOME/.local/bin/git-prompt.sh"
local maybe_host=""
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
	maybe_host="$HOST "
fi
precmd() { GIT_PS1_SHOWCOLORHINTS=true GIT_PS1_SHOWDIRTYSTATE=true GIT_PS1_SHOWUNTRACKEDFILES= GIT_PS1_SHOWUPSTREAM="auto" __git_ps1 "%F{magenta}$maybe_host%F{reset}%F{blue}%1~%F{reset}" " %5F{yellow}\$ %F{reset}" }

autoload -Uz compinit
compinit
alias ls="ls -FG --color"
alias la="ls -A"
alias ll="ls -lh"
alias ..="cd .."
#alias qfilter='grep -E "^[^:]+\:[0-9]+\:[0-9]+: .*$"'

export EDITOR="nvim"

stty erase '^?'

export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="$PATH:$HOME/dd/dd-source/domains/api_platform/rapid/apps/rapid/bin"
export PATH="$PATH:$GOPATH/bin"

compdef _bazel bzl

export PATH="$HOME/bin:$PATH"

# Created by `pipx` on 2025-09-16 11:40:05

# BEGIN SCFW MANAGED BLOCK
alias npm="scfw run npm"
alias pip="scfw run pip"
alias poetry="scfw run poetry"
export SCFW_DD_AGENT_LOG_PORT="10365"
export SCFW_DD_LOG_LEVEL="ALLOW"
export SCFW_HOME="/Users/lindsay.kowalick/.scfw"
# END SCFW MANAGED BLOCK

# opencode
export PATH=/Users/lindsay.kowalick/.opencode/bin:$PATH
export PATH="$HOME/.local/bin:$PATH"
