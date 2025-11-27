
export ZSH="$HOME/.oh-my-zsh"

ZSH_DISABLE_COMPFIX=true

ZSH_THEME="robbyrussell"

# Plugins
# 在 Arch 上，你需要手动 clone zsh-autosuggestions 和 zsh-syntax-highlighting 到插件目录
plugins=(git zsh-autosuggestions zsh-syntax-highlighting z extract web-search docker)

source $ZSH/oh-my-zsh.sh

# User configuration

# --- 样式配置 ---
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#D84040,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=#EC7FA9,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#EC7FA9,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#EC7FA9,bold'
ZSH_HIGHLIGHT_STYLES[path]='fg=#FF1493,underline'
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#C0C0C0"

#压缩命令(extract 文件名)
# 1. 通用别名 (Mac 和 Linux 都能用)
alias ni='nvim'
alias cl='clear'
alias py='python3'
alias hst='history | tail'

# git相关
alias gs='git status'
alias gall='git add --all'
alias gad='git add'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gpl='git pull'
alias gph='git push'
alias glog='git log'
alias glogg='git log --graph --online --decorate'


# 2. 操作系统判断
if [[ "$(uname)" == "Darwin" ]]; then
    # === macOS 专属配置 ===
    
    # Homebrew (只在 Mac 上运行)
    if [[ -f "/opt/homebrew/bin/brew" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
        export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
    fi

    # Mac 特有的软件路径
    export PATH="$PATH:$HOME/.lmstudio/bin"
    export PATH="$HOME/.antigravity/antigravity/bin:$PATH"

    # Mac 的 ls 颜色
    alias ls='ls -G'

elif [[ "$(uname)" == "Linux" ]]; then
    # === Arch Linux 专属配置 ===
    
    # 显卡设置
    alias gpu='prime-run' 
    alias game='prime-run %command%' # 方便你记忆，想用独显就加 gpu 前缀

    # 常用包管理简写
    alias pac='sudo pacman -S'
    alias update='sudo pacman -Syu'
    
    # Linux 的 ls 颜色
    alias ls='ls --color=auto'
fi

# 3. 通用路径 (使用 $HOME 变量代替 /Users/joel)
# Created by `pipx`
export PATH="$PATH:$HOME/.local/bin"

# --- 启动展示 ---
# 确保 fastfetch 已安装，否则不运行以免报错
if command -v fastfetch &> /dev/null; then
    fastfetch --structure "title:os:host:shell:packages:kernel:cpu:gpu:memory" --logo-type small
fi
