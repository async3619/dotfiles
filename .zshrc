if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

alias ws="/cygdrive/c/Users/user/AppData/Local/JetBrains/Toolbox/scripts/webstorm.cmd"
alias ri="/cygdrive/c/Users/user/AppData/Local/JetBrains/Toolbox/scripts/rider.cmd"
alias ii="explorer.exe"

alias github="~/scripts/github-pat.sh"
alias runner="~/scripts/github-runner.sh"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
